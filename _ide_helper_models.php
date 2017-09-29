<?php
/**
 * A helper file for your Eloquent Models
 * Copy the phpDocs from this file to the correct Model,
 * And remove them from this file, to prevent double declarations.
 *
 * @author Barry vd. Heuvel <barryvdh@gmail.com>
 */


namespace Modules\Users\Models{
/**
 * Modules\Users\Models\User
 *
 * @property-read \Illuminate\Notifications\DatabaseNotificationCollection|\Illuminate\Notifications\DatabaseNotification[] $notifications
 * @property-read \Illuminate\Database\Eloquent\Collection|\Modules\Users\Models\Permission[] $permissions
 * @property-read \Illuminate\Database\Eloquent\Collection|\Modules\Users\Models\Role[] $roles
 * @property-write mixed $password
 * @method static \Illuminate\Database\Eloquent\Builder|\Modules\Users\Models\User wherePermissionIs($permission = '')
 * @method static \Illuminate\Database\Eloquent\Builder|\Modules\Users\Models\User whereRoleIs($role = '')
 */
	class User extends \Eloquent {}
}

namespace Modules\Users\Models{
/**
 * Modules\Users\Models\Permission
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\Modules\Users\Models\Role[] $roles
 */
	class Permission extends \Eloquent {}
}

namespace Modules\Users\Models{
/**
 * Modules\Users\Models\Role
 *
 * @property-read \Illuminate\Database\Eloquent\Collection|\Modules\Users\Models\Permission[] $permissions
 */
	class Role extends \Eloquent {}
}

