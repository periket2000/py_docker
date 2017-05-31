# py_docker

Image for running python based git projects.

## python projects

Should have and structure like the following:

```
${PROJECT_DIR} +
               |
               +-> README.md
               +-> ...
               +-> ${SRC_DIR} + (will be added to the PYTHONPATH)
                              |
                              + app.py (main entry point, we call this in the end)
```

Should expose an endpoint that will be the one that we expose in docker.

Check https://github.com/periket2000/rest_api_demo.git, is a Flask app that
exposes the api in 8888 port.

You can configure the app through the "env" property in the json file, in this
case: 

```
PROJECT_DIR: where everything will be installed inside the container.
GIT_REPO: the repo to download.
SRC_DIR: the source folder inside the project. 
```

## sample mesos application json, let's say py-docker.json (see doc/mesos/)

```json
        {
          "id": "py-docker",
          "instances": 1,
          "cpus": 1,
          "mem": 100,
          "constraints": [["hostname", "UNIQUE", ""]],
          "env": {
              "PROJECT_DIR": "/usr/local/pyenv",
              "GIT_REPO": "https://github.com/periket2000/rest_api_demo.git",
              "SRC_DIR": "rest_api_demo"
          },
          "container": {
            "type": "DOCKER",
            "docker": {
              "image": "periket2000/py_docker",
              "network": "BRIDGE",
              "portMappings": [
                {
                  "containerPort": 8888,
                  "hostPort": 0,
                  "servicePort": 0,
                  "protocol": "tcp"
                }
              ]
            }
          },
          "healthChecks": [
              {
                "protocol": "HTTP",
                "portIndex": 0,
                "path": "/api",
                "gracePeriodSeconds": 5,
                "intervalSeconds": 20,
                "maxConsecutiveFailures": 3
              }
            ]
        }
```

## sample load on mesos
```sh
curl -X POST http://<marathon_host>:<marathon_port>/v2/apps -d @<file> -H "Content-type: application/json"
curl -X POST http://192.168.250.101:8080/v2/apps -d @app.json -H "Content-type: application/json"
```
