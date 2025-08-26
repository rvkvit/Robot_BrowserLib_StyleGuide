import requests
import json

def fetch_content_json(fields_key, contentful_key, content_label, app, lang):
    if app == "TU":
        if lang == "FI":
            url = f"https://preview.contentful.com/spaces/p8w932jpy7ij/environments/master/entries?include=10&locale=fi-FI&limit=1000&content_type=page&fields.slug={fields_key}&access_token=eALBB4247dUUroRMMJ-sBSes0Y5Q8NGFP8XE-1SybmU"
        else:
            url = f"https://preview.contentful.com/spaces/p8w932jpy7ij/environments/master/entries?include=10&locale=sv-FI&limit=1000&content_type=page&fields.slug={fields_key}&access_token=6nMC-BvtwFDAyEb6fZf8XK0hUObhJo9JnxpUfnUYAbo"
    else:
        if lang == "FI":
            url = f"https://preview.contentful.com/spaces/p8w932jpy7ij/environments/master/entries?include=10&locale=fi-FI&limit=1000&content_type=page&fields.slug={fields_key}&access_token=eALBB4247dUUroRMMJ-sBSes0Y5Q8NGFP8XE-1SybmU"
        elif lang == "EN":   
            url = f"https://preview.contentful.com/spaces/p8w932jpy7ij/environments/master/entries?include=10&locale=en-US&limit=1000&content_type=page&fields.slug={fields_key}&access_token=eALBB4247dUUroRMMJ-sBSes0Y5Q8NGFP8XE-1SybmU"
        elif lang == "SV":
            url = f"https://preview.contentful.com/spaces/p8w932jpy7ij/environments/master/entries?include=10&locale=sv-SE&limit=1000&content_type=page&fields.slug={fields_key}&access_token=eALBB4247dUUroRMMJ-sBSes0Y5Q8NGFP8XE-1SybmU"
            
    response = requests.get(url)
    json_string = response.text
    json_object = json.loads(json_string)
    includes = json_object.get("includes", {})
    entries = includes.get("Entry", [])

    for entry in entries:
        sys_object = entry.get("sys", {})
        if sys_object.get("id") == contentful_key:
            value = entry.get("fields", {}).get(content_label)
            if isinstance(value, str):
           #     print("1" + value)
                return value
            elif isinstance(value, dict):
                content_array = value.get("content", [])
                for paragraph_object in content_array:
                    if paragraph_object.get("nodeType") == "paragraph":
                        paragraph_content_array = paragraph_object.get("content", [])
                        for text_object in paragraph_content_array:
                            if text_object.get("nodeType") == "text":
                                print(text_object.get(content_label))
                                return text_object.get(content_label)
                                
    return "No contentful value match found"