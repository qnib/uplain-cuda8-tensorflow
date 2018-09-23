# uplain-cuda8-tensorflow
Tensorflow image based on cuda8.

To start the image [qnib/k8s-device-plugin-gpu](https://github.com/qnib/k8s-device-plugin-gpu) is used, installed via [qnib/ansible-scripts/k8s-device-plugin-gpu](https://github.com/qnib/ansible-scripts/tree/master/k8s-device-plugin-gpu).

## Fire up deployment / service

Once the k8s-device-plugin-gpu is installed, apply the kubernetes object.

```bash
$ kubectl apply -f k8s/deployment-jupyter-notebook.yml
deployment.apps "jupyter-notebook" created
$ kubectl apply -f k8s/srv-jupyter-notebook.yml
service "jupyter-notebook" created
$
```

Once the image is downloaded and started, the notebook server should start.

```bash
$ kubectl logs -f pod/jupyter-notebook-79d56d8b85-b8jl7
[II] qnib/init-plain script v0.4.32
> execute entrypoint '/opt/entry/00-logging.sh'
> execute entrypoint '/opt/entry/11-host-internal.sh'
Added $DOCKER_INTERNAL_HOST to hosts /etc/hosts
> execute entrypoint '/opt/entry/99-remove-healthcheck-force.sh'
> execute CMD '/start_jupyter.sh'
[I 19:39:45.215 NotebookApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret
[W 19:39:45.231 NotebookApp] All authentication is disabled.  Anyone who can connect to this server will be able to run code.
[I 19:39:45.239 NotebookApp] Serving notebooks from local directory: /notebooks
[I 19:39:45.239 NotebookApp] The Jupyter Notebook is running at:
[I 19:39:45.239 NotebookApp] http://(jupyter-notebook-79d56d8b85-8jl8d or 127.0.0.1):8888/
[I 19:39:45.239 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[I 19:40:02.555 NotebookApp] 302 GET / (172.31.4.226) 0.61ms
[W 19:40:02.630 NotebookApp] Clearing invalid/expired login cookie username-ec2-54-246-191-44-eu-west-1-compute-amazonaws-com-32768
[I 19:40:49.589 NotebookApp] Writing notebook-signing key to /root/.local/share/jupyter/notebook_secret
[W 19:40:49.591 NotebookApp] Notebook advanced/3_NeuralNetworks/neural_network.ipynb is not trusted
[I 19:15:32.272 NotebookApp] Kernel started: 33112af1-1235-4b8d-ad5d-ab553fb4945f
[I 19:15:32.672 NotebookApp] Adapting to protocol v5.1 for kernel 33112af1-1235-4b8d-ad5d-ab553fb4945f
2018-09-23 19:15:51.539431: I tensorflow/core/platform/cpu_feature_guard.cc:137] Your CPU supports instructions that this TensorFlow binary was not compiled to use: SSE4.1 SSE4.2 AVX
2018-09-23 19:15:51.847171: I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:892] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
2018-09-23 19:15:51.847458: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1030] Found device 0 with properties:
name: GRID K520 major: 3 minor: 0 memoryClockRate(GHz): 0.797
pciBusID: 0000:00:03.0
totalMemory: 3.94GiB freeMemory: 3.90GiB
2018-09-23 19:15:51.847506: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1120] Creating TensorFlow device (/device:GPU:0) -> (device: 0, name: GRID K520, pci bus id: 0000:00:03.0, compute capability: 3.0)
[I 19:17:33.204 NotebookApp] Saving file at /advanced/3_NeuralNetworks/neural_network.ipynb
[W 19:17:33.205 NotebookApp] Notebook advanced/3_NeuralNetworks/neural_network.ipynb is not trusted
2018-09-23 19:23:46.625263: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1120] Creating TensorFlow device (/device:GPU:0) -> (device: 0, name: GRID K520, pci bus id: 0000:00:03.0, compute capability: 3.0)
[I 19:24:01.990 NotebookApp] Starting buffering for 33112af1-1235-4b8d-ad5d-ab553fb4945f:58d8d872b08e42d89206a37bc94ec798
```
