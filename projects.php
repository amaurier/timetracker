<?php
// +----------------------------------------------------------------------+
// | Anuko Time Tracker
// +----------------------------------------------------------------------+
// | Copyright (c) Anuko International Ltd. (https://www.anuko.com)
// +----------------------------------------------------------------------+
// | LIBERAL FREEWARE LICENSE: This source code document may be used
// | by anyone for any purpose, and freely redistributed alone or in
// | combination with other software, provided that the license is obeyed.
// |
// | There are only two ways to violate the license:
// |
// | 1. To redistribute this code in source form, with the copyright
// |    notice or license removed or altered. (Distributing in compiled
// |    forms without embedded copyright notices is permitted).
// |
// | 2. To redistribute modified versions of this code in *any* form
// |    that bears insufficient indications that the modifications are
// |    not the work of the original author(s).
// |
// | This license applies to this document only, not any other software
// | that it may be combined with.
// |
// +----------------------------------------------------------------------+
// | Contributors:
// | https://www.anuko.com/time_tracker/credits.htm
// +----------------------------------------------------------------------+

require_once('initialize.php');
import('ttGroupHelper');

// Access checks.
if (!(ttAccessAllowed('view_own_projects') || ttAccessAllowed('manage_projects'))) {
  header('Location: access_denied.php');
  exit();
}
if (MODE_PROJECTS != $user->getTrackingMode() && MODE_PROJECTS_AND_TASKS != $user->getTrackingMode()) {
  header('Location: feature_disabled.php');
  exit();
}
// End of access checks.

$showFiles = $user->isPluginEnabled('at');

if($user->can('manage_projects')) {
  $active_projects = $showFiles ? ttGroupHelper::getActiveProjectsWithFiles() : ttGroupHelper::getActiveProjects();
  $inactive_projects = $showFiles ? ttGroupHelper::getInactiveProjectsWithFiles() : ttGroupHelper::getInactiveProjects();
} else
  $active_projects = $user->getAssignedProjects();

$smarty->assign('active_projects', $active_projects);
$smarty->assign('inactive_projects', $inactive_projects);
$smarty->assign('show_files', $user->isPluginEnabled('at'));
$smarty->assign('title', $i18n->get('title.projects'));
$smarty->assign('content_page_name', 'projects.tpl');
$smarty->display('index.tpl');
