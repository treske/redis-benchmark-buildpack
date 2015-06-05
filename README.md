# redis-benchmark-buildpack

The `redis-benchmark-buildpack` is a Cloud Foundry buildpack for running Redis benchmarks. It compiles `redis-benchmark`and a custom Ruby app into a droplet which can then be used to execute a benchmark run from within the CF elastic runtime.

## Usage

* Create a file named `redis_benchmark_spec.yml` and add the following contents

```
benchmark:
  clients: 75
  requests: 150000
```

* Create a service or user-provided service instance named `redis` pointing to your Redis server
* Create a benchmark app by pushing the `redis_benchmark_spec.yml` as artifact

```
cf push <APP-NAME> -p redis_benchmark_spec.yml -b https://github.com/treske/redis-benchmark-buildpack.git
```

* Bind the service instance `redis` to the pushed app
* Restage the app
* Invoke the app
