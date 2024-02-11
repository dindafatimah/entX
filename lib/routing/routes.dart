const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const booksPageDisplayName = "Book Collections";
const booksPageRoute = "/drivers";

const membersPageDisplayName = "Members";
const membersPageRoute = "/members";

const librariansPageDisplayName = "Librarians";
const librariansPageRoute = "/librarians";

const tasksPageDisplayName = "Tasks";
const tasksPageRoute = "/tasks";

const chatPageDisplayName = "Chat";
const chatPageRoute = "/chat";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}



List<MenuItem> sideMenuItemRoutes = [
 MenuItem(overviewPageDisplayName, overviewPageRoute),
 MenuItem(booksPageDisplayName, booksPageRoute),
 MenuItem(membersPageDisplayName, membersPageRoute),
 MenuItem(librariansPageDisplayName, librariansPageRoute),
 MenuItem(tasksPageDisplayName, tasksPageRoute),
 MenuItem(chatPageDisplayName, chatPageRoute),
 MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];
