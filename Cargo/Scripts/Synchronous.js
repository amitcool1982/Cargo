function ExecuteSynchronously(url, method, args) {

    var executor = new Sys.Net.XMLHttpSyncExecutor();
    // Instantiate a WebRequest.

    var request = new Sys.Net.WebRequest();
    // Set the request URL.

    request.set_url(url + '/' + method);
    // Set the request verb.

    request.set_httpVerb('POST');
    // Set request header.

    request.get_headers()['Content-Type'] = 'application/json; charset=utf-8';
    // Set the executor.

    request.set_executor(executor);

    // Serialize argumente into a JSON string.

    request.set_body(Sys.Serialization.JavaScriptSerializer.serialize(args));

    // Execute the request.

    request.invoke();

    if (executor.get_responseAvailable()) {

        return (executor.get_object());
    }

    return (false);
}