# Boats and Slips

1. Authentication
2. List all boats
3. Create a boat
4. Get a single boat
5. Edit a boat
6. Delete a boat
7. List all slips
8. Create a slip
9. Get a single slip
10. Edit a slip
11. Delete a slip

# Authentication

You can access the API without any authentication.

# List all boats

List all the boats currently stored in the database

`GET /api/v1/boats`

Response

```
Status: 200 OK

[{
  "id": 4,
  "name": "the name for this boat",
  "boat_type": "the type of boat",
  "length": 10,
  "at_sea": true,
  "created_at": "2017-05-15T00:45:34.715Z",
  "updated_at": "2017-05-15T00:45:34.715Z"
}]
```

# Create a single boat

`POST /api/v1/boats`

Input
---

__Name__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Type__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Description__

name&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the name of the boat
boat_type&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the type of boat
length&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the size of the boat



```
{
  "name": "the name for this boat",
  "boat_type": "the type of boat",
  "length": 10,
}

```

```
Status: 201 Created

{
  "id": 4,
  "name": "the name for this boat",
  "boat_type": "the type of boat",
  "length": 10,
  "at_sea": true,
  "created_at": "2017-05-15T00:45:34.715Z",
  "updated_at": "2017-05-15T00:45:34.715Z"
}
```

# Get a single boat

`GET /api/v1/boats/:id`

Response

```
Status: 200 OK

{
  "id": 4,
  "name": "the name for this boat",
  "boat_type": "the type of boat",
  "length": 10,
  "at_sea": true,
  "created_at": "2017-05-15T00:45:34.715Z",
  "updated_at": "2017-05-15T00:45:34.715Z"
}
```

# Edit a boat

`PATCH /api/v1/boats/:id`

Input
---

__Name__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Type__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Description__

name&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the name of the boat
boat_type&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the type of boat
length&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the size of the boat
at_sea&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;boolean&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the size of the boat


```
{
  "name": "the name for this boat",
  "boat_type": "the type of boat",
  "length": 10,
  "at_sea": true
}

```

```
Status: 200 OK

{
  "id": 4,
  "name": "the name for this boat",
  "boat_type": "the type of boat",
  "length": 10,
  "at_sea": true,
  "created_at": "2017-05-15T00:45:34.715Z",
  "updated_at": "2017-05-15T00:45:34.715Z"
}
```

# Delete a boat

`DELETE /api/v1/boats/:id`

```
Status: 204 No Content

```

# List all slips

List all the slips currently stored in the database

`GET /api/v1/slips`

Response

```
Status: 200 OK

[{
  "id": 3,
  "number": 99999,
  "boat_id": null,
  "arrival_date": null,
  "created_at": "2017-05-15T01:52:32.950Z",
  "updated_at": "2017-05-15T01:52:32.950Z"
}]
```

# Create a single slip

`POST /api/v1/slips`

Input
---

__Name__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Type__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Description__

number&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;integer&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the name of the boat
arrival_date&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the size of the boat



```
{
  "number": null,
  "arrival_date": null
}

```

```
Status: 201 Created

{
  "id": 3,
  "number": null,
  "boat_id": null,
  "arrival_date": null,
  "created_at": "2017-05-15T01:52:32.950Z",
  "updated_at": "2017-05-15T01:52:32.950Z"
}
```

# Get a single slip

`GET /api/v1/slips/:id`

Response

```
Status: 200 OK

{
  "id": 3,
  "number": null,
  "boat_id": null,
  "arrival_date": null,
  "created_at": "2017-05-15T01:52:32.950Z",
  "updated_at": "2017-05-15T01:52:32.950Z"
}
```

# Edit a slip

`PATCH /api/v1/slips/:id`

Input
---

__Name__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Type__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Description__

number&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;integer&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the name of the boat
arrival_date&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the size of the boat
boat_id&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;integer&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the size of the boat

```
{
  "number": null,
  "boat_id": null,
  "arrival_date": null
}

```

```
Status: 200 OK

{
  "id": 3,
  "number": null,
  "boat_id": null,
  "arrival_date": null,
  "created_at": "2017-05-15T01:52:32.950Z",
  "updated_at": "2017-05-15T01:52:32.950Z"
}
```

# Delete a slip

`DELETE /api/v1/slips/:id`

```
Status: 204 No Content

```