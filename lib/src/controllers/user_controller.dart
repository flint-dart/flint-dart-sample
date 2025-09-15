import 'package:flint_dart/flint_dart.dart';
import 'package:flint_dart/storage.dart';
import 'package:sample/src/models/user_model.dart';

class UserController {
  Future<Response> index(Request req, Response res) async {
    final users = await User().all();
    return res.json({
      "message": 'List of user ',
      "users": users.map((user) => user.toMap()).toList()
    });
  }

  Future<Response?> show(Request req, Response res) async {
    var user = await User().find(req.params['id']);
    // User user = await User().update(req.params['id'], {"name": "IBK Upade"});

    if (user != null) {
      return res.send('User ${user.toMap()}');
    }

    return res.status(404).json({"message": "user not found"});
  }

  Future<Response> create(Request req, Response res) async {
    return res.send('Creating user...');
  }

  Future<Response> update(Request req, Response res) async {
    try {
      final String userId = req.params['id']!;
      final body = await req.form();
      final String? name = body['name'];
      String? profilePicUrl;
      // Use the Storage class to handle file updates
      if (await req.hasFile('profile_pic')) {
        final file = await req.file('profile_pic');
        if (file != null) {
          final User? userToUpdate = await User().find(userId);
          if (userToUpdate != null || userToUpdate?.profilePicUrl != null) {
            // Update the existing profile picture
            profilePicUrl = await Storage.update(
                userToUpdate!.profilePicUrl!, file,
                subdirectory: 'profiles');
          } else {
            // Create a new profile picture
            profilePicUrl =
                await Storage.create(file, subdirectory: 'profiles');
          }
        }
      }
      // Find the user and prepare the data for an update
      final User? userToUpdate = await User().find(userId);
      final Map<String, dynamic> updateData = {};
      if (name != null) {
        updateData['name'] = name;
      }
      if (profilePicUrl != null) {
        updateData['profile_pic'] = profilePicUrl;
      }
      // Update the user in the database
      if (updateData.isNotEmpty) {
        await userToUpdate!.update(userId, updateData);
      }

      final updatedUser = await User().find(userId);

      return res.json({
        "status": "success",
        "message": "User updated successfully.",
        "user": updatedUser?.toMap(),
      });
    } on ValidationException catch (e) {
      return res.status(422).json({"status": "errors", "errors": e.errors});
    } catch (e) {
      return res.status(500).json({
        "status": "error",
        "message": "Failed to update user: ${e.toString()}",
      });
    }
  }

  Future<Response> delete(Request req, Response res) async {
    return res.send('Deleting user ${req.params['id']}');
  }
}
