# Apache Redirector Demo

This project demonstrates the use of Apache's `mod_rewrite` and makes use of the `RewriteMap` directove to implement URL redirection based on a mapping defined in a text file.  It provides a simple setup using Docker Compose, making it easy to run and experiment with.

## Purpose and Use Case

This demo showcases how to efficiently manage a large number of URL redirections using `mod_rewritemap`. Instead of writing individual `RewriteRule` directives for each redirect, a map file (`redirects.txt`) is used to store the source and destination URLs.  This approach simplifies maintenance and makes it easier to update redirections without modifying the Apache configuration directly.  This pattern is especially useful when dealing with a high volume of redirects or when redirects are managed by a separate system.

The specific use case demonstrated here is redirecting requests to specific files within an "original" directory to corresponding files in a "target" directory.  It also shows how to redirect to external websites.


## Installation and Setup

1. **Clone the repository:**

   ```bash
   git clone git@github.com:thepearson/apache-redirection.git
   cd apache-redirection
   ```


2. **Install Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed on your system.  You can find instructions for installation on the official Docker website: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

3. **Run the demo:**

    ```bash
    docker-compose up -d

    ````

This will start the Apache web server in a Docker container.

4. **Access the demo:** Open your web browser and navigate to `http://localhost/original/a.html`. You should be redirected to `http://localhost/target/a.html`.  Try accessing other files in the `/original/` directory (e.g., `b.html`, `c.html`, etc.) to see the redirections in action.  Note that `g.html` redirects to an external site.


## File Structure Explanation

1. `docker-compose.yml`: Defines the Docker container setup, including the Apache image, port mappings, and volume mounts.
2. `redirects.conf`: Apache configuration file that includes the mod_rewrite rules and points to the `redirects.txt` map file.
3. `redirects.txt`: Contains the URL mapping used by `mod_rewritemap`. Each line defines a mapping: `original_url` `target_url`.
4. `httpd.conf`: The main Apache configuration file. This file includes `redirects.conf`


## Potential Improvements/Extensions

 - **More complex rewrite rules**: This demo uses simple redirects. You could explore more advanced `mod_rewrite` features, such as regular expressions, to match URL patterns.
 - **Dynamic redirect mapping**: Instead of a static `redirects.txt` file, you could integrate with a database or other data source to generate the redirect map dynamically.
 - **Error handling**: Implement error handling for cases where a requested URL is not found in the redirect map.
 - **dbm lookup file**: Use the `httxt2dbm` CLI tool to convert the text map to a `dbm` file format which is indexed and much faster.


## Building for production

You can build a container to use for production either via your own pipeline or locally.


```
docker build -t [yourproject]:[version] .
```


## License

MIT