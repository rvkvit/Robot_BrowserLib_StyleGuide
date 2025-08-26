from browserstack.local import Local
import json
import urllib.parse
import subprocess
import os
from config import config

class custom_lib:
    desired_cap = None
    bs_local = None

    properties            = config.load_properties()
    browserstack_username = properties['browserstack_username']
    browserstack_access_key = properties['browserstack_access_key']

    project_name = "Browser Lib Pattern Check"
    build_name = "framework-build-1"
    build_tag = "Regression"

    browserstack_local = "true"

    def __init__(self):
        self.desired_cap = {
            'browser_version': 'latest',
            'browserstack.username': self.browserstack_username,
            'browserstack.accessKey': self.browserstack_access_key,
            'project': self.project_name,
            'build': self.build_name,
            'buildTag': self.build_tag,
            'resolution': '1280x1024',
            'browserstack.local': self.browserstack_local,
            'browserstack.localIdentifier': 'local_connection_name',
            'browserstack.playwrightVersion': '1.latest',
            'client.playwrightVersion': '1.latest',
            'browserstack.debug': 'true',  
            'browserstack.console': 'info', 
            'browserstack.networkLogs': 'true',  
            'browserstack.networkLogsOptions':
                {
                    'captureContent': 'true'
            }
        }

        self.bs_local = None

    def createCdpUrl(self, browser):
        clientPlaywrightVersion = str(subprocess.getoutput(
            'playwright --version')).strip().split(" ")[1]
        self.desired_cap['client.playwrightVersion'] = clientPlaywrightVersion
        if (browser == 'chromium'):
            self.desired_cap['os'] = 'Windows'
            self.desired_cap['os_version'] = '10'
            self.desired_cap['browser'] = 'playwright-chromium'

        elif (browser == 'firefox'):
            self.desired_cap['os'] = 'OS X'
            self.desired_cap['os_version'] = 'Ventura'
            self.desired_cap['browser'] = 'playwright-firefox'
            # Optional: Add Firefox-specific arguments if needed
            self.desired_cap['args'] = []

        else:
            self.desired_cap['os'] = 'OS X'
            self.desired_cap['os_version'] = 'Ventura'
            self.desired_cap['browser'] = 'playwright-webkit'
            # Optional: Add WebKit-specific arguments if needed
            self.desired_cap['args'] = []

        cdpUrl = 'wss://cdp.browserstack.com/playwright?caps=' + \
            urllib.parse.quote(json.dumps(self.desired_cap))
        print(cdpUrl)
        return cdpUrl

    def getPlatformDetails(self):
        platformDetails = self.desired_cap['os'] + " " + self.desired_cap['os_version'] + \
            " " + self.desired_cap['browser'] + " " + \
            self.desired_cap['browser_version']
        print(platformDetails)
        return platformDetails

    def startLocalTunnel(self):
        if not self.bs_local:
            self.bs_local = Local()
            bs_local_args = {
                "key": self.browserstack_access_key, "localIdentifier": "local_connection_name"}
            self.bs_local.start(**bs_local_args)

    def stopLocalTunnel(self):
        if self.bs_local:
            self.bs_local.stop()
            self.bs_local = None

    def getViewportResolution(self):
        resolution = self.desired_cap.get('resolution', '1920x1080') # default to 1920x1080
        width, height = resolution.split('x')
        return {'width': int(width), 'height': int(height)}

    def getExecutionMode(self):
        return os.environ.get('EXECUTION_MODE', 'remote')  # default to remote