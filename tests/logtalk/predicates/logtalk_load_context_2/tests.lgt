%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
%  This file is part of Logtalk <http://logtalk.org/>
%  Copyright 1998-2016 Paulo Moura <pmoura@logtalk.org>
%  
%  Licensed under the Apache License, Version 2.0 (the "License");
%  you may not use this file except in compliance with the License.
%  You may obtain a copy of the License at
%  
%      http://www.apache.org/licenses/LICENSE-2.0
%  
%  Unless required by applicable law or agreed to in writing, software
%  distributed under the License is distributed on an "AS IS" BASIS,
%  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%  See the License for the specific language governing permissions and
%  limitations under the License.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- object(hook,
	implements(expanding)).

	:- public(result/2).
	:- dynamic(result/2).

	term_expansion(a(_,_,_,_), _) :-
		logtalk_load_context(term, Term),
		assertz(result(term, Term)),
		fail.
	term_expansion(a(_,_,_,_), _) :-
		logtalk_load_context(variable_names, VariableNames),
		assertz(result(variable_names, VariableNames)),
		fail.
	term_expansion(a(_,_,_,_), _) :-
		logtalk_load_context(term_position, Position),
		assertz(result(term_position, Position)),
		fail.
	term_expansion((:- end_object), _) :-
		logtalk_load_context(source, Path),
		assertz(result(source, Path)),
		fail.
	term_expansion((:- end_object), _) :-
		logtalk_load_context(file, Path),
		assertz(result(file, Path)),
		fail.
	term_expansion((:- end_object), _) :-
		logtalk_load_context(basename, Basename),
		assertz(result(basename, Basename)),
		fail.
	term_expansion((:- end_object), _) :-
		logtalk_load_context(directory, Directory),
		assertz(result(directory, Directory)),
		fail.
	term_expansion((:- end_object), _) :-
		logtalk_load_context(target, PrologFile),
		assertz(result(target, PrologFile)),
		fail.
	term_expansion((:- end_object), _) :-
		logtalk_load_context(entity_identifier, Entity),
		assertz(result(entity_identifier, Entity)),
		fail.
	term_expansion((:- end_object), _) :-
		logtalk_load_context(entity_prefix, Prefix),
		assertz(result(entity_prefix, Prefix)),
		fail.
	term_expansion((:- end_object), _) :-
		logtalk_load_context(entity_type, Type),
		assertz(result(entity_type, Type)),
		fail.
	term_expansion((:- end_object), _) :-
		logtalk_load_context(stream, Stream),
		assertz(result(stream, Stream)),
		fail.

:- end_object.



:- object(tests,
	extends(lgtunit)).

	:- info([
		version is 1.2,
		author is 'Paulo Moura',
		date is 2016/07/08,
		comment is 'Unit tests for the logtalk_load_context/2 built-in predicate.'
	]).

	:- uses(hook, [
		result/2
	]).

	% only true during source file compilation
	test(logtalk_load_context_2_1) :-
		\+ logtalk_load_context(_, _).

	% source file related keys
	test(logtalk_load_context_2_2) :-
		this(This),
		object_property(This, file(_, Directory)),
		atom_concat(Directory, 'sample.lgt', Source),
		logtalk_load(Source, [hook(hook)]),
		result(source, Source0), Source0 == Source,
		result(file, Source1), Source1 == Source,
		result(basename, Basename), Basename == 'sample.lgt',
		result(directory, Directory0), Directory0 == Directory,
		result(target, PrologFile0), atom(PrologFile0),
		result(stream, Stream), ground(Stream).

	% source file entity related keys
	test(logtalk_load_context_2_3) :-
		result(entity_identifier, EntityIdentifier), EntityIdentifier == sample,
		result(entity_prefix, EntityPrefix), logtalk::entity_prefix(sample, EntityPrefix),
		result(entity_type, EntityType), EntityType == object.

	% source file term related keys
	test(logtalk_load_context_2_4) :-
		result(term, Term), ::variant(Term, a(A,B,B,A)),
		result(variable_names, VariableNames), ::variant(VariableNames, ['A'=_, 'B'=_]),
		result(term_position, TermPosition), ground(TermPosition).

:- end_object.
