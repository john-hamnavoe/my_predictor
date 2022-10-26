// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
import AutofocusController from "./autofocus_controller"
import AutosaveController from "./autosave_controller"
application.register("hello", HelloController)
application.register("autofocus", AutofocusController)
application.register("autosave", AutosaveController)

// Import and register all TailwindCSS Components
import { Alert, Dropdown, Modal, Tabs, Popover, Toggle, Slideover } from "tailwindcss-stimulus-components"
application.register('alert', Alert)
application.register('dropdown', Dropdown)
application.register('modal', Modal)
application.register('tabs', Tabs)
application.register('popover', Popover)
application.register('toggle', Toggle)
application.register('slideover', Slideover)