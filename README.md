# LIT Realty

This project was developed using JPA and Connection Pooling. 
Tomcat was used as the Server/Container.
Authentication/Authorisation is implemented using Apache Shiro.


The project was developed to satisfy the following spec:

A company called LIT Realty has recently formed in Limerick and has decided to base itself in the
industry incubation centre in LIT’s Moylish Park campus. LIT Realty sell property all over Ireland and
currently advertise their properties in the national press. To facilitate these advertisements, LIT
Realty have developed a complete database of their properties and their selling agents. You must
develop a complete web application for LIT Realty that will offer the following functionality. I have
broken the functionality down into four categories. 

#### Category #1: Agent Functionality (30%)

1. Log-in and log-out feature for agents (each agent must be authenticated using their user-name
and password from the database. Once logged in, each agent must able to:
  1.1. View, edit, delete and insert a property to the database. An insertion/update must also
include the ability to upload a new/updated image(s) for the property in question. A
property can have multiple images associated with it and your update/insert features
must cater for this requirement. Any deletion must require the agent to confirm
whether they are sure they want to proceed with this deletion or not.
  1.2. Each property that appears on the website has a vendor (who has trusted LIT Realty to
sell their home). You can assume that each property has one vendor and that, the
agent who is responsible for selling the property will manage their details. Only
authenticated agents can view vendor information. It is possible that one vendor may
be selling more than one property. There is currently no “vendor” table within the
database.
  1.3. Once an agent has been authenticated, every subsequent page they visit must display
their (profile) picture.


#### Category #2: Customer Functionality (25%)

1. Every customer will be able to search the database for a property based on its price and
location. The search results should be presented in tabular form. This table must include a
thumbnail image for the property. As an extra option, the customer should also be able to refine
their search results - consider using Data Tables (https://datatables.net/) to help you refine your
search results.

2. You must enable the thumbnail image so that it appears as a link that when clicked on, will
provide extra information about the property in question (this is in effect a drill-down: extra
information such as the square footage of the house, property style, property-type, garage type,
number of bathrooms, number of bedrooms as well as details of the agent responsible for selling
the house should be displayed – you should also display the larger images for the property). You
must also mark on Google maps the location of the property

3. On the drill-down page for each property a customer should be able to add a property to a list of
their “favourites”. This list can be viewed at any time by the customer and you must also
provide the ability for the customer to remove any property from their list of favourites. The list
of favourites must also be available to the customer after their browser session has been 
terminated. Obviously, each customers list of favourites will be independent of each other.
Assume that no customer will access the site from more than one computer.

4. The ability to view the most recently added properties to the system. This is a list of any
properties in the database (regardless of their location/price etc) which have been added in the
last 7 days


#### Category #3: Unique Feature (30%)
You must add a unique feature to this assignment. The feature you add must complement the
existing functionality

### Notes
Your solution must use JPA and connection pooling.

You must use Tomcat as your server/container.

All authorisation/authentication must be implemented using Apache Shiro. You may also decide to
use Shiro for cryptography, and session management but are not required to do so.

Inserts/Updates will affect multiple tables in the database.

Only authenticated agents should be able to access features 1.1 and 1.2.

Customers are not expected to log-in and LIT Realty do not store any details about them other than
their favourite properties (which may not be stored on the server).

Sensitive information must not be transmitted in plain text and instead must be sent over HTTPS –
using HTTPS for all connections is recommended.

All code must be resistant to SQLi and XXS and all data must be validated before entering the
database.

All passwords stored in the database must be encrypted. Currently, the passwords of all agents
appear in plain text – this will have to be addressed.

You are permitted to change the structure of the database to achieve your aims.

Your application must be as user friendly and intuitive as possible.

All erroneous conditions must be handled gracefully.

Your solution must adhere to the MVC architecture (no JavaScript should appear directly in your
JSP’s. Instead, provide links to the scripts themselves).
