%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
%  This file is part of Logtalk <http://logtalk.org/>    
%  
%  Logtalk is free software. You can redistribute it and/or modify it under
%  the terms of the FSF GNU General Public License 3  (plus some additional
%  terms per section 7).        Consult the `LICENSE.txt` file for details.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- initialization((
	(current_logtalk_flag(modules, supported) -> ensure_loaded(module); true),
	logtalk_load([category], [events(deny), reload(skip)]),
	logtalk_load([objects, database, maze, graph], [events(deny), reload(skip)]),
	logtalk_load([plain, benchmarks], [events(deny)])
)).
