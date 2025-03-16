import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../widgets/escalation_listings_widget.dart';

class HomeNavigationHub extends NyStatefulWidget with BottomNavPageControls {
  static RouteView path = ("/home", (_) => HomeNavigationHub());

  HomeNavigationHub()
      : super(
            child: () => _HomeNavigationHubState(),
            stateName: path.stateName());

  /// State actions
  static NavigationHubStateActions stateActions =
      NavigationHubStateActions(path.stateName());
}

class _HomeNavigationHubState extends NavigationHub<HomeNavigationHub> {
  /// Layouts:
  /// - [NavigationHubLayout.bottomNav] Bottom navigation
  /// - [NavigationHubLayout.topNav] Top navigation
  NavigationHubLayout? layout = NavigationHubLayout.topNav(
      backgroundColor: Colors.white, animationDuration: Duration(seconds: 1));

  /// Should the state be maintained
  @override
  bool get maintainState => false;

  /// Navigation pages
  _HomeNavigationHubState()
      : super(() async {
          return {
            0: NavigationTab(
              title: "Pending",
              page: EscalationListings(
                  //   escalations: escalations,
                  ), // create using: 'dart run nylo_framework:main make:stateful_widget home_tab'
              // icon: Icon(Icons.home),
              // activeIcon: Icon(Icons.home),
            ),
            1: NavigationTab(
              title: "Ongoing",
              page: EscalationListings(
                  // escalations: escalations,
                  ), // create using: 'dart run nylo_framework:main make:stateful_widget settings_tab'
              // icon: Icon(Icons.settings),
              // activeIcon: Icon(Icons.settings),
            ),
            2: NavigationTab(
              title: "Resolved",
              page: EscalationListings(
                  // escalations: escalations,
                  ), // create using: 'dart run nylo_framework:main make:stateful_widget settings_tab'
              // icon: Icon(Icons.settings),
              // activeIcon: Icon(Icons.settings),
            ),
          };
        });

  /// Handle the tap event
  @override
  onTap(int index) {
    super.onTap(index);
  }
}
