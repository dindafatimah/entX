import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:flutter_web_dashboard/pages/members/members.dart';
import 'package:flutter_web_dashboard/pages/books/books.dart';
import 'package:flutter_web_dashboard/pages/librarians/librarians.dart';
import 'package:flutter_web_dashboard/pages/tasks/tasks.dart';
import 'package:flutter_web_dashboard/pages/chat/chat.dart';
import 'package:flutter_web_dashboard/pages/overview/overview.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(const OverviewPage());
    case booksPageRoute:
      return _getPageRoute(const BooksPage());
    case membersPageRoute:
      return _getPageRoute(const MembersPage());
    case librariansPageRoute:
      return _getPageRoute(const LibrariansPage());
    case tasksPageRoute:
      return _getPageRoute(const TasksPage());
    case chatPageRoute:
      return _getPageRoute(ChatPage());
    default:
      return _getPageRoute(const AuthenticationPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
