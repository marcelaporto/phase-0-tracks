# What are some common HTTP status codes?

----
## Informational 1xx
Request received, continuing process. This class of status code indicates a provisional response, consisting only of the Status-Line and optional headers, and is terminated by an empty line.

* **100 Continue**: The server has received the request headers and the client should proceed to send the request body
* **101 Switching Protocols**: The requester has asked the server to switch protocols and the server has agreed to do so

## Successful 2xx
This class of status codes indicates the action requested by the client was received, understood, accepted, and processed successfully.

* **200 OK:** Standard response for successful HTTP requests

* **202 Accepted:** The request has been accepted for processing, but the processing has not been completed. The request might or might not eventually be acted upon, as it might be disallowed when processing actually takes place.

## Redirection 3xx
This class of status code indicates that further action needs to be taken by the user agent in order to fulfill the request.

-***300 Multiple Choice** : The request has more than one possible responses. User-agent or user should choose one of them.
* **301 Moved Permanently**:  The requested resource has been assigned a new permanent URI and any future references to this resource SHOULD use one of the returned URIs

* **302 Found:** The requested resource resides temporarily under a different URI. Since the redirection might be altered on occasion, the client SHOULD continue to use the Request-URI for future requests.

* **304 Not Modified**: If the client has performed a conditional GET request and access is allowed, but the document has not been modified, the server SHOULD respond with this status code.

## Client Error 4xx
The 4xx class of status code is intended for cases in which the client seems to have erred.

* **400 Bad Request**:  The request could not be understood by the server due to malformed syntax. The client SHOULD NOT repeat the request without modifications.

* **401 Unauthorized:**  The request requires user authentication.

* **404 Not Found**:  The server has not found anything matching the Request-URI. No indication is given of whether the condition is temporary or permanent.

## Server Error 5xx
Cases in which the server is aware that it has erred or is incapable of performing the request

* **500 Internal Server** Error: The server encountered an unexpected condition which prevented it from fulfilling the request

* **501 Not Implemented**:  The server does not support the functionality required to fulfill the request.

* **503 Service Unavailable**:  The server is currently unable to handle the request due to a temporary overloading or maintenance of the server.
* **550 Permission Denied**: The server is stating the account you have currently logged in as does not have permission to perform the action you are attempting.

# What is the difference between a GET request and a POST request? When might each be used?

----
* GET - Requests data from a specified resource

    * GET requests should never be used when dealing with sensitive data
    * GET requests have length restrictions
    * GET requests should be used only to retrieve data

* POST - Submits data to be processed to a specified resource

    * POST requests do not remain in the browser history
    * POST requests cannot be bookmarked
    * POST requests have no restrictions on data length
    * This method packages the name/value pairs inside the body of the HTTP request, which makes for a cleaner URL

*In practical terms*:
A POST request gets input from the query string and through the request body. A GET request just gets input from the query string . GET is used for viewing something, without changing it, while POST is used for changing something. For example, a search page should use GET, while a form that changes your password should use POST.

# What is a cookie? How does it relate to HTTP requests?

A cookie is a small piece of data, given ID tags, sent from a website and stored on the user's computer by the user's web browser while the user is browsing. Cookies were designed to be a reliable mechanism for websites to remember stateful information (such as items added in the shopping cart in an online store) or to record the user's browsing activity (including clicking particular buttons, logging in, or recording which pages were visited in the past).

Other kinds of cookies perform essential functions in the modern web. Perhaps most importantly, authentication cookies are the most common method used by web servers to know whether the user is logged in or not, and which account they are logged in with. Without such a mechanism, the site would not know whether to send a page containing sensitive information, or require the user to authenticate themselves by logging in

*Creating cookies*:  When receiving an HTTP request, a server can send a Set-Cookie header with the response (it is in the response header.). The cookie is usually stored by the browser and, afterwards, the cookie value is sent along with every request made to the same server as the content of a Cookie HTTP request header. Additionally, an expiration delay can be specified as well as restrictions to a specific domain and path, limiting how long and to which site the cookie is sent to.
