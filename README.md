A tiny RESTful API to index the page content.
==============

API Endpoints
---------------

| **Endpoint**  | **Functionality** |
| ------------- | ------------- |
| GET /api/pages  | Lists the urls and content stored in the database  |
| POST /api/pages  | Stores the content and receives the url and parsed content  |

Examples
---------------

Demo app lives here https://tiny-parser.herokuapp.com

List the URLs:
https://tiny-parser.herokuapp.com/api/pages

Show the parsed content:
https://tiny-parser.herokuapp.com/api/pages?page[url]=http://example.com/
