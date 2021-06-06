<?php

namespace App\Http\Middleware;

use Closure;

class UserPermission
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $user = session(".config_user");
        if (!$user) return redirect("/sign-in");
        if ($user->user_permission != 0) return redirect("/");
        return $next($request);
    }
}
