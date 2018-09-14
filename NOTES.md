Individual Development Plan (IDP)

Models: Users, Goals, Trainings, UserTrainings

A User has many goals, has many usertrainings,and has many trainings through usertrainings.
A Training has many usertrainings and has many users through usertrainings.
A UserTraining belongs to a user and belongs to a training.
A Goal belongs to a user.

Controllers
A user should be able to login or signup. Signup should automatically login the user.
A user should also be able to logout.
There should be methods to ensure that a user is logged in and that user can only create, edit or delete information in their account.
A user should be able to create, read, edit and destroy a goal.
A user should be able to select a training from a list or add new traingings to the list.

Views
User forms: signup, login, and index. The index will include the users name, goals, and trainings.
Goal forms: create, edit and show. A training checklist item will be included in create and edit. Show will list goals and allow a user to delete a goal.
