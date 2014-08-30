# Attendance

_A web application and API for [HackPDX](http://hackpdx.com/)._

## Team

Here’s who’s hackin on this thing:

* [David LaChasse](https://github.com/dlachasse)
* [Gilad Ronat](https://github.com/giladronat)
* [Cory Reed](https://github.com/swashcap)

## API

So much data! These are the API endpoints, and should be prefixed with the API URL (to be determined).

### /users/*

**`/users/:id`**

CRUD operations for users. Here’s an example response for a `GET` request:

```json
{
  "id": 34582031,
  "name": "Bob McDermont",
  "email": "bobmcdermont@school.com",
  "avatar": "/public/avatars/bob-mcdermont.jpg",
  "role": "student"
}
```

**`/users/:id/classroom_periods/`**

A list of `classroom_periods` that the user subscribes to. Example:

```json
[{
  "id": 3851730234,
  "title": "Chemistry I: Introduction to Chemistry",
  "room": "120A",
  "period": 5,
  "excert": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  "description": "<p>Etiam quis libero sollicitudin, imperdiet libero sit amet, vestibulum augue.</p><p>Nulla eget nunc sit amet justo interdum tincidunt. Nulla arcu mi, blandit at euismod et, porttitor quis ligula. Ut sapien odio, pharetra eu quam non, tempus eleifend ipsum. Sed sed tristique quam. In porttitor ornare urna ut facilisis.</p>",
  "teacher": {
    "id": 29412518,
    "name": "Pat Smith",
    "email": "patsmith@school.com",
    "avatar": "/public/avatars/pat-smith.jpg"
  }
}, {
  "id": 78901738102,
  "title": "English III",
  "room": "10B",
  "period": 4,
  ...
}]
```

### /classroom_periods/*

**`/classroom_periods/:id`**

Get all information for a single classroom period, including `Course` information, teacher and an array of students. Example response:

```json
{
  "id": 3851730234,
  "title": "Chemistry I: Introduction to Chemistry",
  "room": "120A",
  "period": 5,
  "excert": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  "description": "<p>Etiam quis libero sollicitudin, imperdiet libero sit amet, vestibulum augue.</p><p>Nulla eget nunc sit amet justo interdum tincidunt. Nulla arcu mi, blandit at euismod et, porttitor quis ligula. Ut sapien odio, pharetra eu quam non, tempus eleifend ipsum. Sed sed tristique quam. In porttitor ornare urna ut facilisis.</p>",
  "teacher": {
    "id": 29412518,
    "name": "Pat Smith",
    "email": "patsmith@school.com",
    "avatar": "/public/avatars/pat-smith.jpg"
  }
  "students": [{
    "id": 34582031,
    "name": "Bob McDermont",
    "email": "bobmcdermont@school.com",
    "avatar": "/public/avatars/bob-mcdermont.jpg"
  }
    ...
  ]
}
```

**`/classroom_periods/:id/attendance`**

List of attendance dates:

```json
[
  "2014-09-02",
  "2014-09-03",
  "2014-09-04",
  "2014-09-05",
  ...
]
```

**`/classroom_periods/:id/attendance/:date`**

List of attendances for the particular date.Example

```json
[{
  "id": 71840723180
  "attended": true,
  "student": {
    "id": 34582031,
    "name": "Bob McDermont",
    "email": "bobmcdermont@school.com",
    "avatar": "/public/avatars/bob-mcdermont.jpg"
  }
}, {
  "id" 481035101545,
  "attended": false,
  "student": {
    "id": 38501434,
    "name": "Steve Balmer",
    "email": "stevebalmer@school.com",
    "avatar": "/public/avatars/stevebalmer.jpg"
  }
}]
```

**`/classroom_periods/:id/attendance/:date/:student_id`**

Record for an individual student’s attendance on the specified date.

## Available Data

```
Table classroom_periods
  "room":string
  "period":integer
  "teacher_id":integer
  "course_id":integer
  "created_at":datetime
  "updated_at":datetime
end
```

```
Table courses
  "title":string
  "description":text
  "excerpt":text
  "created_at":datetime
  "updated_at":datetime
end
```

```
Table presences
  "attended":boolean
  "schedule_id":integer
  "created_at":datetime
  "updated_at":datetime
end
```

```
Table schedules
  "classroom_period_id":integer
  "user_id":integer
  "created_at":datetime
  "updated_at":datetime
end
```

```
Table users
  "first_name":string
  "last_name":string
  "email":string
  "avatar":string
  "role":integer
  "created_at":datetime
  "updated_at":datetime
end
```