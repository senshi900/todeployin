import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'auth_route.dart';


class MainRoute {
  Router get route {
    return Router()
      ..get('/', (Request req) => Response.badRequest(body: "No EndPoint"))
      ..mount('/auth', AuthRoute().route)
      ..all('/<ignored|.*>',
          (Request req) => Response.badRequest(body: "No EndPoint"));
  }
}
