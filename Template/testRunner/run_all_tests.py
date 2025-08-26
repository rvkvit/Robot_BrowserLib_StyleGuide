import os
import subprocess
import sys
import time
from pathlib import Path

os_name = os.name

def run_AllTests():
    print(os.getcwd())
    if os_name == 'nt':  # Windows
       test_directory = os.path.join(os.path.dirname(os.getcwd()), r'tests')
    else:  # Linux/Mac
        test_directory = os.path.join(os.getcwd(), 'Template/tests')
    print("Test dir is" + test_directory)
    for root, dirs, files in os.walk(test_directory): 
        for file in files:
            print(file)
            if file.endswith('.robot'):
                test_file = os.path.join(root, file)
                print(f'Running {test_file}...')
                timestamp = time.strftime("%Y-%m-%d_%H-%M-%S")
                timestamp = time.strftime("%m-%d_%H-%M-%S")
                suite_name = os.path.splitext(os.path.basename(test_file))[0]
                project_dir = Path(__file__).resolve().parent.parent
                results_dir = project_dir/f"results/{suite_name}_{timestamp}"
                result = subprocess.run(['robot','--outputdir', results_dir, test_file] + sys.argv[1:])
                if result.returncode != 0:
                    print(f'Error occurred while running {test_file}')
   

if __name__ == "__main__":
    run_AllTests()
