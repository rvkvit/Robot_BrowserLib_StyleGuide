import time
import hashlib
import jwt
import json
import requests
import base64
from requests.exceptions import HTTPError, Timeout, RequestException
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
from config import config

class zephyr_utilities:

    properties            = config.load_properties()
    secretKey             = properties['JIRA-SECRET-KEY']
    accountID             = properties['JIRA-ACCOUNT-ID']
    accessKey             = properties['JIRA-ACCESS-KEY']
    user                  = properties['JIRA-USER']
    authentication_token  = properties['authenticationToken']
 
    projectName           = "DIGI"
    cycleName             = "Motor Automation"

    jiraBaseUrl           = "https://lahitapiola.atlassian.net/"
    issueURL              = "rest/agile/1.0/issue/"
    projectURL            = "rest/api/2/project/"
    cycleURL              = "/public/rest/api/1.0/cycles/search"
    cycleCanonicalURL     = "GET&/public/rest/api/1.0/cycles/search"
    zephyrBaseURL         = "https://prod-api.zephyr4jiracloud.com/connect"
    folderURL             = "/public/rest/api/1.0/folders"
    folderCanonicalURL    = "GET&/public/rest/api/1.0/folders"
    executionURL          = "/public/rest/api/1.0/execution"
    executionCanonicalURL = "POST&/public/rest/api/1.0/execution&"
    executeURL            = "/public/rest/api/1.0/execution/"
    executeCanonicalURL   = "PUT&/public/rest/api/1.0/execution/"

    @staticmethod
    def sha256_hash(data):
        return hashlib.sha256(data.encode()).hexdigest()

    @staticmethod
    def get_jwt_token(canonical_path):
        JWT_EXPIRE = 3600
        secret_key_string = zephyr_utilities.secretKey
        payload_token = {
            "sub": zephyr_utilities.accountID,
            "qsh": zephyr_utilities.sha256_hash(canonical_path),
            "iss": zephyr_utilities.accessKey,
            "exp": int(time.time()) + JWT_EXPIRE,
            "iat": int(time.time())
        }

        secret_key_bytes = secret_key_string.encode()
        if len(secret_key_bytes) < 32:
            raise ValueError("Secret key length must be at least 32 bytes for HS256")

        jwt_token = jwt.encode(payload_token, secret_key_bytes, algorithm='HS256')
        return jwt_token

    @staticmethod
    def get_encoded_auth():
        auth = f"{zephyr_utilities.user}:{zephyr_utilities.authentication_token}"
        encoded_bytes = base64.b64encode(auth.encode('utf-8'))
        encoded_auth = encoded_bytes.decode('utf-8')
        return encoded_auth

    @staticmethod
    def getSession_id(issueKey):
            url_endpoint = zephyr_utilities.jiraBaseUrl + zephyr_utilities.issueURL + issueKey + '?fields=id'
            headers = {
                "Content-Type": "application/json",
                "Authorization": 'Basic ' + zephyr_utilities.get_encoded_auth()}

            logger.debug("Headers: {}".format(headers))
            logger.debug("endpoint: {}".format(url_endpoint))

            try:

                response = requests.get(
                    url=url_endpoint,
                    headers=headers,
                    timeout=60,
                    verify=True)

                logger.debug("Request status code: {}".format(response.status_code))

                logger.trace(response.content)

                ##Add logging in case of failures
                if response.status_code == 404: # pylint: disable=no-else-return
                    logger.error('Issue with key {}, does not exists'.format(issueKey))
                    return False
                elif response.status_code == 500:
                    logger.error('Error 500, there can be multiple issues, check parameters')
                    return False
                elif response.status_code == 200:
                    logger.debug(response.content)
                    logger.trace(response.json())

                    json_data = response.json()

                    id_value = json_data['id']

                    logger.console("Returning from getissue_id...")
                    return id_value
                else:
                    logger.error('Unknow error occured in getting session id')
                    logger.error(response)
                    return False

            except HTTPError as err:
                raise HTTPError("HTTPError occured: {}".format(err))
            except ConnectionError as err:
                raise ConnectionError("ConnectionError occured: {}".format(err))
            except Timeout as err:
                raise Timeout("Timeout occured: {}".format(err))
            except RequestException as err:
                raise RequestException("RequestException occured: {}".format(err))
            except Exception as err:
                raise Exception("Exception occured: {}".format(err))

    @staticmethod
    def getProjectId():
            
            url_endpoint = zephyr_utilities.jiraBaseUrl + zephyr_utilities.projectURL + zephyr_utilities.projectName

            headers = {
                "Content-Type": "application/json",
                "Authorization": 'Basic ' + zephyr_utilities.get_encoded_auth()}

            logger.debug("Headers: {}".format(headers))
            logger.debug("endpoint: {}".format(url_endpoint))

            try:

                response = requests.get(
                    url=url_endpoint,
                    headers=headers,
                    timeout=60,
                    verify=True)

                logger.debug("Request status code: {}".format(response.status_code))

                logger.trace(response.content)

                ##Add logging in case of failures
                if response.status_code == 404: # pylint: disable=no-else-return
                    logger.error('Cycle with key {}, does not exists'.format(zephyr_utilities.projectName))
                    return False
                elif response.status_code == 500:
                    logger.error('Error 500, there can be multiple issues, check parameters')
                    return False
                elif response.status_code == 200:
                    logger.debug(response.content)
                    logger.trace(response.json())

                    json_data = response.json()

                    project_id = json_data['id']

                    logger.console("Returning from getProjectId...")
                    print(project_id)
                    return project_id
                else:
                    logger.error('Unknow error occured in getting project id')
                    logger.error(response)
                    return False

            except HTTPError as err:
                raise HTTPError("HTTPError occured: {}".format(err))
            except ConnectionError as err:
                raise ConnectionError("ConnectionError occured: {}".format(err))
            except Timeout as err:
                raise Timeout("Timeout occured: {}".format(err))
            except RequestException as err:
                raise RequestException("RequestException occured: {}".format(err))
            except Exception as err:
                raise Exception("Exception occured: {}".format(err))

    @staticmethod
    def get_cycle_id():

        cycle_id = None
        project_id = zephyr_utilities.getProjectId()
        url_endpoint = f"{zephyr_utilities.zephyrBaseURL}{zephyr_utilities.cycleURL}?projectId={project_id}&versionId=-1"
        get_all_cycles_canonical_path = f"{zephyr_utilities.cycleCanonicalURL}&projectId={project_id}&versionId=-1"
        jwt_token = zephyr_utilities.get_jwt_token(get_all_cycles_canonical_path)

        headers = {
            "Authorization": 'JWT ' + jwt_token,
            "Content-Type": "text/plain",
            "zapiAccessKey": zephyr_utilities.accessKey
        }

        try:
            response = requests.get(
                    url=url_endpoint,
                    headers=headers,
                    timeout=60,
                    verify=True)

            if response.status_code == 404:
                print(f"Cycle with key {cycle_id}, does not exist")

            elif response.status_code == 500:
                print("Error 500, there can be multiple issues, check parameters")
                # Log error here if needed
                # report.update_test_log("Execution Info", "Error 500, there can be multiple issues, check parameters, function getCycleID", Status.FAIL)

            elif response.status_code == 200:
                json_data = response.json()
                for item in json_data:
                    if isinstance(item, dict):
                        cycle_name_value = item.get("name")
                        if cycle_name_value and cycle_name_value.lower() == zephyr_utilities.cycleName.lower():
                            return item.get("id")

            else:
                print("Unknown error occurred in getting cycle id")
                # Log error here if needed

        except requests.exceptions.RequestException as e:
            print(f"Request error: {e}")
        
        return cycle_id

    @staticmethod
    def get_folder_id(folderName):
        folder_id = None
        project_id = zephyr_utilities.getProjectId()
        cycle_id   = zephyr_utilities.get_cycle_id()
        url_endpoint = f"{zephyr_utilities.zephyrBaseURL}{zephyr_utilities.folderURL}?&cycleId={cycle_id}&projectId={project_id}&versionId=-1"
        get_all_cycles_canonical_path = f"{zephyr_utilities.folderCanonicalURL}&cycleId={cycle_id}&projectId={project_id}&versionId=-1"
        jwt_token = zephyr_utilities.get_jwt_token(get_all_cycles_canonical_path)
       
        headers = {
            "Authorization": 'JWT ' + jwt_token,
            "Content-Type": "text/plain",
            "zapiAccessKey": zephyr_utilities.accessKey
        }

        try:
            response = requests.get(
                    url=url_endpoint,
                    headers=headers,
                    timeout=60,
                    verify=True)
            if response.status_code == 404:
                print(f"Cycle with key {cycle_id}, does not exist")
                # Log error here if needed
                # report.update_test_log("Execution Info", f"Cycle with key {cycle_id}, does not exist", Status.FAIL)

            elif response.status_code == 500:
                print("Error 500, there can be multiple issues, check parameters")
                # Log error here if needed
                # report.update_test_log("Execution Info", "Error 500, there can be multiple issues, check parameters, function getCycleID", Status.FAIL)

            elif response.status_code == 200:
                json_data = response.json()
                for item in json_data:
                    if isinstance(item, dict):
                        folder_name_value = item.get("name")
                        if folder_name_value and folder_name_value.lower() == folderName.lower():
                            return item.get("id")

            else:
                print("Unknown error occurred in getting folder id")
                # Log error here if needed

        except requests.exceptions.RequestException as e:
            print(f"Request error: {e}")
        
        return cycle_id

    @staticmethod
    def get_jira_execution_id(issueKey, folderName):
            execution_id = None
            url_endpoint = zephyr_utilities.zephyrBaseURL + zephyr_utilities.executionURL
            jwt_token = zephyr_utilities.get_jwt_token(zephyr_utilities.executionCanonicalURL)
            execution_data = {
                "cycleId": zephyr_utilities.get_cycle_id(),
                "issueId": zephyr_utilities.getSession_id(issueKey),
                "projectId": zephyr_utilities.getProjectId(),
                "folderId": zephyr_utilities.get_folder_id(folderName),
                "versionId": -1
            }

            try:
                headers = {
                    "Authorization": f"JWT {jwt_token}",
                    "Content-Type": "application/json",
                    "zapiAccessKey": zephyr_utilities.accessKey
                }
                response = requests.post(url_endpoint, headers=headers, json=execution_data)

                if response.status_code == 404:
                    print("Execution id does not exist")
                    #log.error("Execution id does not exist")
                elif response.status_code == 500:
                    print("Error 500, there can be multiple issues, check parameters")
                    #log.error("Error 500, there can be multiple issues, check parameters")
                elif response.status_code == 200:
                    response_json = response.json()
                    execution_object = response_json.get("execution")
                    if execution_object:
                        execution_id = execution_object.get("id")

                else:
                    print("Unknown error occurred in getting execution id")
                    #log.error("Unknown error occurred")
            except requests.exceptions.RequestException as e:
                print(f"Request failed: {e}")
            except json.JSONDecodeError as e:
                print(f"JSON decode error: {e}")

            return execution_id

    @staticmethod
    def update_jira_execution_status(issueKey,folderName,status):
       # print(issueKey,folderName ,status)
        execution_id = zephyr_utilities.get_jira_execution_id(issueKey,folderName)
        execute_canonical_path = f"{zephyr_utilities.executeCanonicalURL}{execution_id}&"
        url_endpoint = f"{zephyr_utilities.zephyrBaseURL}{zephyr_utilities.executeURL}{execution_id}"
        jwt_token = zephyr_utilities.get_jwt_token(execute_canonical_path)

        
        status_data = {"id": status}
        status_json = json.dumps(status_data)

        
        timestamp = time.strftime(f"%d.%m.%Y %H:%M:%S")
        if status == "1":
            comment = f"Execution from robot framework test passed. Executed on : {timestamp}"
        else:
            comment = f"Execution from robot framework test failed. Executed on : {timestamp}"

        execution_data = {
            "cycleId": zephyr_utilities.get_cycle_id(),
            "comment": comment,
            "issueId": zephyr_utilities.getSession_id(issueKey),
            "projectId": zephyr_utilities.getProjectId(),
            "status": json.loads(status_json),
            "folderId": zephyr_utilities.get_folder_id(folderName),
            "versionId": -1
        }

        try:
            headers = {
                "Authorization": f"JWT {jwt_token}",
                "Content-Type": "application/json",
                "zapiAccessKey": zephyr_utilities.accessKey
            }
            response = requests.put(url_endpoint, headers=headers, data=json.dumps(execution_data))

            if response.status_code == 404:
                print(f"Execution with key {execution_id}, does not exist")
            elif response.status_code == 500:
                print("Error 500, there can be multiple issues, check parameters")
            elif response.status_code == 200:
                print("Test case status updated successfully")
            else:
                print("Unknown error occurred in updating jira")
        except requests.exceptions.RequestException as e:
            print(e)