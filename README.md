# mlp-java-trainable-service-template

This repository is a project template for creating a new trainable [Caila](https://app.caila.io/) service.

> Caila is a platform for hosting microservices based on ML models.
> It is a powerful tool that can cover every aspect of your solution’s lifecycle, from model training and QA to deployment and monitoring.

[Create a new project](https://github.com/new?template_name=mlp-java-trainable-service-template&template_owner=just-ai) from this template to start developing a service of your own!

## Get started

Start by getting yourself acquainted with the contents of [`Main.kt`](./src/main/kotlin/com/mlp/fitaction/Main.kt).
In terms of features, this is a simple trainable “Hello World” service:

- Its `fit` method accepts *json/any* dataset and "trains" the demo model.
- Its `predict` method returns a value from FitDatasetData based on the key passed to PredictRequestData, or `no entry` if the key is not represented in the map.

The service relies on the Caila [Java SDK](https://github.com/just-ai/mlp-java-sdk) to expose its functionality to the platform.

## Build Docker image

To build the service locally, run `./build.sh` in the project root.
You need to have [Docker Engine](https://docs.docker.com/engine/install/) installed and running.

The build script will create a Docker image, push it to the [public Caila Docker registry](https://docker-pub.caila.io/), and print the image URL to the console:

```txt
--------------------------------------------------
Docker image: docker-pub.caila.io/caila-public/mlp-java-trainable-service-xxxxxxxxxxxxxxxx:master
--------------------------------------------------
```

You will need this URL to configure your service in Caila.

> ⚠ The public Caila Docker registry has a limited storage time and is intended for educational purposes only.
> Do not use it for production.

## Create Caila service

1. Sign in to [Caila](https://app.caila.io/) or sign up for a new account.
2. Go to *My space* and select *Images* in the sidebar.
   > 🛈 If you don’t see this tab, go to *My space* → *Services*, select *Create service*, and submit a request for access.
   > Our customer support team will get back to you shortly.
3. Select *Create image*. Provide the image name and the URL you got from the build script.
4. On the image description page, select *Create service*. Provide the service name, mark model as *Fittable* and select *json/any* in *FitDatasetType*. Leave the other settings at their defaults.
5. You should now see your service in the *Services* tab. Go to its page and click on *Fit*. To upload the dataset select *Upload*, choose type *json/any*, fill the dataset name and attach a file with the following content: `{"map": { "hello": "Hello world!" }}`. Then fill a name for the new fitted service and put an empty JSON (`{}`) into *Fit configuration*. Click on *Fit* and *Go to a new service*.
6. Wait for the fit to be completed (the status indicator should turn from yellow to green, and you should see `SUCCESS` status).
7. You can check events related to the training process in *Events history* menu.
8. Go to the *Testing* and try sending a request with a JSON body like `{"text": "hello"}`.

Your service is up and running if you can see the output with the sentences from the dataset file you uploaded.

If you would like to learn more about Caila, check out our official [documentation](https://docs.caila.io/).

## Multi-fit mode

This template also supports creating a mutli-fit Caila service:

1. Select the image you created in previous steps.
2. On the image description page, select *Create service*. Provide the service name, mark model as *Fittable* and select *json/any* in *FitDatasetType*.
3. Select *Training type* `Multi Fit`. Leave the other settings at their defaults.
4. You should now see your service in the *Services* tab. Go to its page and click on *Fit*. To upload the dataset select *Upload*, choose type *json/any*, fill the dataset name and attach a file with the content (for example [`data.json`](./data.json)).
5. Then fill a name for the new fitted service and put an JSON (`{"mode":"multi"}`) into *Fit configuration*. Click on *Fit* and *Go to a new service*.
6. Wait for the fit to be completed (the status indicator should turn from yellow to green, and you should see `SUCCESS` status).
7. You can check events related to the training process in *Events history* menu.
8. Go to the *Testing* and try sending a request with a JSON body like `{"text": "The Ultimate Question of Life, the Universe, and Everything"}`.

Your service is up and running if you can see the output with the sentences from the dataset file you uploaded.

### Refit

Also, you can refit your service on a different dataset:

1. Go to services page (*Fitted* tab) and select your service.
2. Click on *Refit* button. Select existing dataset or upload new one.
3. Put an JSON (`{"mode":"multi"}`) into *Fit configuration*. Click on *Refit*.
4. Wait for the refit to be completed (the status indicator should turn from yellow to green, and you should see `SUCCESS` status).
5. You can check events related to the training process in *Events history* menu.
6. Go to the *Testing* and try sending a request with a JSON body.

Your service is up and running if you can see the output with the sentences from the new dataset file you uploaded.

## License

This project is licensed under Apache License 2.0.
