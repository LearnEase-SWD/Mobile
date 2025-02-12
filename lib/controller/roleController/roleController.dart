import '../../models/roleService/roleService.dart';
import '../../utils/request/RoleRequest.dart';

class RoleController {
  final RoleService roleService;


  RoleController({required this.roleService});


  Future<Map<String, dynamic>> createRole(RoleRequest roleRequest) async {
    try {
      final result = await roleService.createRole(roleRequest);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  // Phương thức để xóa vai trò
  Future<Map<String, dynamic>> deleteRole(RoleRequest roleRequest) async {
    try {
      final result = await roleService.deleteRole(roleRequest);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getAllRoles() async {
    try {
      final result = await roleService.getAllRoles();
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
