# docker-trifecta

Docker container for [trifecta](https://github.com/ldaniels528/trifecta) v0.22.0rc8b-0.10.1.0. Supports Kafka 0.10

Note: the original project is running the stable version this is a just a quick fork to allow easy testing of the beta version of trifecta not a long term fork.

Start the container with the following command:

```sh
docker run -d --name trifecta -p 9000:9000 -e ZK_HOST=localhost:2181 janschultecom/docker-trifecta
```
where ZK_HOST is the url to your Zookeeper instance (e.g. localhost:2181).
