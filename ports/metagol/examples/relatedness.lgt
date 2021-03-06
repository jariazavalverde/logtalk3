%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  This file is part of Logtalk <https://logtalk.org/>
%
%  Copyright 2016 Metagol authors
%  Copyright 2018-2019 Paulo Moura
%  All rights reserved.
%
%  Redistribution and use in source and binary forms, with or without
%  modification, are permitted provided that the following conditions
%  are met:
%
%  1. Redistributions of source code must retain the above copyright
%     notice, this list of conditions and the following disclaimer.
%
%  2. Redistributions in binary form must reproduce the above copyright
%     notice, this list of conditions and the following disclaimer in
%     the documentation and/or other materials provided with the
%     distribution.
%
%  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
%  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
%  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
%  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
%  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
%  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
%  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
%  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
%  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
%  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
%  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
%  POSSIBILITY OF SUCH DAMAGE.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- set_logtalk_flag(hook, metagol).


:- object(relatedness,
	implements(metagol_example_protocol),
	extends(metagol)).

	%% tell Metagol to use the BK
	body_pred(parent/2).

	%% metarules
	metarule([P,Q],   [P,A,B], [[Q,A,B]]).
	metarule([P,Q],   [P,A,B], [[Q,B,A]]).
	metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]).

	%% background knowledge
	parent(a,b).
	parent(a,c).
	parent(c,e).
	parent(c,f).
	parent(d,c).
	parent(g,h).

	learn(Clauses) :-
		Pos = [
			target(a,b),
			target(a,c),
			target(a,e),
			target(a,f),
			target(f,a),
			target(a,a),
			target(d,b),
			target(h,g)
		],
		Neg = [
			target(g,a),
			target(a,h),
			target(e,g),
			target(g,b)
		],
		^^learn(Pos, Neg, Prog),
		^^program_to_clauses(Prog, Clauses).

	learn :-
		learn(Clauses),
		^^pprint_clauses(Clauses).

:- end_object.
