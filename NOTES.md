
[X] Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

[X] Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

[ ] Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

[ ] You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

[X] Your application must provide standard user authentication, including signup, login, logout, and passwords.

[] Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

[X] You must include and make use of a nested resource with the appropriate RESTful URLs.