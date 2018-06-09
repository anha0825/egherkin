-module(egherkin_SUITE).
-compile(export_all).

-include_lib("common_test/include/ct.hrl").
-include_lib("assert.hrl").

init_per_suite(Config) ->
	Config.

end_per_suite(Config) ->
	Config.

init_per_testcase(_TestCase, Config) ->
	Config.

end_per_testcase(_TestCase, Config) ->
	Config.

all() -> [
	lexer_simple_scenario,
	lexer_background,
	lexer_datatable_step,
	lexer_docstring_step,
	lexer_scenario_outline,
	lexer_feature_tags,
	lexer_scenario_tags,
	lexer_multiple_scenarios,
	lexer_lots_of_crlfs,
	lexer_lots_of_comments,

	from_lexer_simple_scenario,
	from_lexer_background,
	from_lexer_datatable_step,
	from_lexer_docstring_step,
	from_lexer_scenario_outline,
	from_lexer_feature_tags,
	from_lexer_scenario_tags,
	from_lexer_multiple_scenarios,
	from_lexer_lots_of_crlfs,

	parse_simple_scenario,
	parse_background,
	parse_datatable_step,
	parse_docstring_step,
	parse_scenario_outline,
	parse_feature_tags,
	parse_scenario_tags,
	parse_multiple_scenarios,
	parse_lots_of_crlfs
].

%%region lex

lexer_simple_scenario(_) ->
	Scenario = simple_scenario,
	?assertEqual(lexer_output(Scenario), egherkin:lexer(source(Scenario))),
	ok.

lexer_background(_) ->
	Scenario = background,
	?assertEqual(lexer_output(Scenario), egherkin:lexer(source(Scenario))),
	ok.

lexer_datatable_step(_) ->
	Scenario = datatable_step,
	?assertEqual(lexer_output(Scenario), egherkin:lexer(source(Scenario))),
	ok.

lexer_docstring_step(_) ->
	Scenario = docstring_step,
	?assertEqual(lexer_output(Scenario), egherkin:lexer(source(Scenario))),
	ok.

lexer_scenario_outline(_) ->
	Scenario = scenario_outline,
	?assertEqual(lexer_output(Scenario), egherkin:lexer(source(Scenario))),
	ok.

lexer_feature_tags(_) ->
	Scenario = feature_tags,
	?assertEqual(lexer_output(Scenario), egherkin:lexer(source(Scenario))),
	ok.

lexer_scenario_tags(_) ->
	Scenario = scenario_tags,
	?assertEqual(lexer_output(Scenario), egherkin:lexer(source(Scenario))),
	ok.

lexer_multiple_scenarios(_) ->
	Scenario = multiple_scenarios,
	?assertEqual(lexer_output(Scenario), egherkin:lexer(source(Scenario))),
	ok.

lexer_lots_of_crlfs(_) ->
	Scenario = lots_of_crlfs,
	?assertEqual(lexer_output(Scenario), egherkin:lexer(source(Scenario))),
	ok.

lexer_lots_of_comments(_) ->
	Scenario = lots_of_comments,
	?assertEqual(lexer_output(Scenario), egherkin:lexer(source(Scenario))),
	ok.

%%endregion

%%region from_lexer

from_lexer_simple_scenario(_) ->
	Scenario = simple_scenario,
	?assertEqual(parse_output(Scenario), egherkin:from_lexer(lexer_output(Scenario))),
	ok.

from_lexer_background(_) ->
	Scenario = background,
	?assertEqual(parse_output(Scenario), egherkin:from_lexer(lexer_output(Scenario))),
	ok.

from_lexer_datatable_step(_) ->
	Scenario = datatable_step,
	?assertEqual(parse_output(Scenario), egherkin:from_lexer(lexer_output(Scenario))),
	ok.

from_lexer_docstring_step(_) ->
	Scenario = docstring_step,
	?assertEqual(parse_output(Scenario), egherkin:from_lexer(lexer_output(Scenario))),
	ok.

from_lexer_scenario_outline(_) ->
	Scenario = scenario_outline,
	?assertEqual(parse_output(Scenario), egherkin:from_lexer(lexer_output(Scenario))),
	ok.

from_lexer_feature_tags(_) ->
	Scenario = feature_tags,
	?assertEqual(parse_output(Scenario), egherkin:from_lexer(lexer_output(Scenario))),
	ok.

from_lexer_scenario_tags(_) ->
	Scenario = scenario_tags,
	?assertEqual(parse_output(Scenario), egherkin:from_lexer(lexer_output(Scenario))),
	ok.

from_lexer_multiple_scenarios(_) ->
	Scenario = multiple_scenarios,
	?assertEqual(parse_output(Scenario), egherkin:from_lexer(lexer_output(Scenario))),
	ok.

from_lexer_lots_of_crlfs(_) ->
	Scenario = lots_of_crlfs,
	?assertEqual(parse_output(Scenario), egherkin:from_lexer(lexer_output(Scenario))),
	ok.

%%endregion

%%region parse

parse_simple_scenario(_) ->
	Scenario = simple_scenario,
	?assertEqual(parse_output(Scenario), egherkin:parse(source(Scenario))),
	ok.

parse_background(_) ->
	Scenario = background,
	?assertEqual(parse_output(Scenario), egherkin:parse(source(Scenario))),
	ok.

parse_datatable_step(_) ->
	Scenario = datatable_step,
	?assertEqual(parse_output(Scenario), egherkin:parse(source(Scenario))),
	ok.

parse_docstring_step(_) ->
	Scenario = docstring_step,
	?assertEqual(parse_output(Scenario), egherkin:parse(source(Scenario))),
	ok.

parse_scenario_outline(_) ->
	Scenario = scenario_outline,
	?assertEqual(parse_output(Scenario), egherkin:parse(source(Scenario))),
	ok.

parse_feature_tags(_) ->
	Scenario = feature_tags,
	?assertEqual(parse_output(Scenario), egherkin:parse(source(Scenario))),
	ok.

parse_scenario_tags(_) ->
	Scenario = scenario_tags,
	?assertEqual(parse_output(Scenario), egherkin:parse(source(Scenario))),
	ok.

parse_multiple_scenarios(_) ->
	Scenario = multiple_scenarios,
	?assertEqual(parse_output(Scenario), egherkin:parse(source(Scenario))),
	ok.

parse_lots_of_crlfs(_) ->
	Scenario = lots_of_crlfs,
	?assertEqual(parse_output(Scenario), egherkin:parse(source(Scenario))),
	ok.

%%endregion

%%region test data

source(simple_scenario) ->
	<<
		"Feature: Addition\r\n"
		"Scenario: Add two numbers\r\n"
		"Given I have entered 50 into the calculator\r\n"
		"And I have entered 70 into the calculator\r\n"
		"When I press add\r\n"
		"Then the result should be 120 on the screen\r\n"
	>>;
source(background) ->
	<<
		"Feature: Addition\r\n"
		"Background:\r\n"
		"Given I have entered 50 into the calculator\r\n"
		"And I have entered 70 into the calculator\r\n"
		"When I press add\r\n"
		"Then the result should be 120 on the screen\r\n"
		"Scenario: Add two numbers\r\n"
		"Given I have entered 50 into the calculator\r\n"
		"And I have entered 70 into the calculator\r\n"
		"When I press add\r\n"
		"Then the result should be 120 on the screen\r\n"
	>>;
source(datatable_step) ->
	<<
		"Feature: Addition\r\n"
		"Scenario: Add two numbers\r\n"
		"Given I have entered the following numbers into the calculator:\r\n"
		"| a | b |\r\n"
		"| 1 | 1 |\r\n"
		"| 2 | 2 |\r\n"
		"When I press add\r\n"
		"Then the result should be 120 on the screen\r\n"
	>>;
source(docstring_step) ->
	<<
		"Feature: Addition\r\n"
		"Scenario: Add two numbers\r\n"
		"Given I have entered the following numbers into the calculator:\r\n"
		"\"\"\"\r\n"
		"1\r\n"
		"2\r\n"
		"\"\"\"\r\n"
		"When I press add\r\n"
		"Then the result should be 120 on the screen\r\n"
	>>;
source(scenario_outline) ->
	<<
		"Feature: Addition\r\n"
		"Scenario Outline: Add two numbers\r\n"
		"Given I have entered the numbers <a> and <b> into the calculator:\r\n"
		"When I press add\r\n"
		"Then the result should be 120 on the screen\r\n"
		"Examples:\r\n"
		"| a | b |\r\n"
		"| 1 | 1 |\r\n"
		"| 2 | 2 |\r\n"
	>>;
source(feature_tags) ->
	<<
		"@critical\r\n"
		"@non-regression @ui\r\n"
		"Feature: Addition\r\n"
		"Scenario: Add two numbers\r\n"
		"Given I have entered 50 into the calculator\r\n"
		"And I have entered 70 into the calculator\r\n"
		"When I press add\r\n"
		"Then the result should be 120 on the screen\r\n"
	>>;
source(scenario_tags) ->
	<<
		"Feature: Addition\r\n"
		"@critical\r\n"
		"@non-regression @ui\r\n"
		"Scenario: Add two numbers\r\n"
		"Given I have entered 50 into the calculator\r\n"
		"And I have entered 70 into the calculator\r\n"
		"When I press add\r\n"
		"Then the result should be 120 on the screen\r\n"
	>>;
source(multiple_scenarios) ->
	<<
		"@critical\r\n"
		"Feature: Addition\r\n"
		"@ui\r\n"
		"Scenario: Add two numbers\r\n"
		"Given I have entered the following numbers into the calculator:\r\n"
		"\"\"\"\r\n"
		"1\r\n"
		"2\r\n"
		"\"\"\"\r\n"
		"And I have entered the following numbers into the calculator:\r\n"
		"| a | b |\r\n"
		"| 1 | 1 |\r\n"
		"| 2 | 2 |\r\n"
		"When I press add\r\n"
		"Then the result should be 120 on the screen\r\n"
		"Scenario Outline: Add two numbers\r\n"
		"Given I have entered the numbers <a> and <b> into the calculator:\r\n"
		"When I press add\r\n"
		"Then the result should be 120 on the screen\r\n"
		"Examples:\r\n"
		"| a | b |\r\n"
		"| 1 | 1 |\r\n"
		"| 2 | 2 |\r\n"
		"@data\r\n"
		"Scenario: Add two numbers\r\n"
		"Given I have entered 50 into the calculator\r\n"
		"And I have entered 70 into the calculator\r\n"
		"When I press add\r\n"
		"Then the result should be 120 on the screen\r\n"
	>>;
source(lots_of_crlfs) ->
	<<
		"\r\n"
		"@critical\r\n"
		"\r\n"
		"Feature: Addition\r\n"
		"\r\n"
		"Background:\r\n"
		"\r\n"
		"Given I have entered 50 into the calculator\r\n"
		"\r\n"
		"And I have entered 70 into the calculator\r\n"
		"\r\n"
		"When I press add\r\n"
		"\r\n"
		"Then the result should be 120 on the screen\r\n"
		"\r\n"
		"@ui\r\n"
		"\r\n"
		"Scenario: Add two numbers\r\n"
		"\r\n"
		"Given I have entered the following numbers into the calculator:\r\n"
		"\r\n"
		"\"\"\"\r\n"
		"1\r\n"
		"\r\n"
		"2\r\n"
		"\"\"\"\r\n"
		"\r\n"
		"And I have entered the following numbers into the calculator:\r\n"
		"\r\n"
		"| a | b |\r\n"
		"\r\n"
		"| 1 | 1 |\r\n"
		"\r\n"
		"| 2 | 2 |\r\n"
		"\r\n"
		"When I press add\r\n"
		"\r\n"
		"Then the result should be 120 on the screen\r\n"
		"\r\n"
		"Scenario Outline: Add two numbers\r\n"
		"\r\n"
		"Given I have entered the numbers <a> and <b> into the calculator:\r\n"
		"\r\n"
		"When I press add\r\n"
		"\r\n"
		"Then the result should be 120 on the screen\r\n"
		"\r\n"
		"Examples:\r\n"
		"\r\n"
		"| a | b |\r\n"
		"\r\n"
		"| 1 | 1 |\r\n"
		"\r\n"
		"| 2 | 2 |\r\n"
		"\r\n"
		"@data\r\n"
		"\r\n"
		"Scenario: Add two numbers\r\n"
		"\r\n"
		"Given I have entered 50 into the calculator\r\n"
		"\r\n"
		"And I have entered 70 into the calculator\r\n"
		"\r\n"
		"When I press add\r\n"
		"\r\n"
		"Then the result should be 120 on the screen\r\n"
		"\r\n"
	>>;
source(lots_of_comments) ->
	<<
		"# comments\r\n"
		"@critical\r\n"
		"# comments\r\n"
		"Feature: Addition\r\n"
		"# comments\r\n"
		"Background:\r\n"
		"# comments\r\n"
		"Given I have entered 50 into the calculator\r\n"
		"# comments\r\n"
		"And I have entered 70 into the calculator\r\n"
		"# comments\r\n"
		"When I press add\r\n"
		"# comments\r\n"
		"Then the result should be 120 on the screen\r\n"
		"# comments\r\n"
		"@ui\r\n"
		"# comments\r\n"
		"Scenario: Add two numbers\r\n"
		"# comments\r\n"
		"Given I have entered the following numbers into the calculator:\r\n"
		"# comments\r\n"
		"\"\"\"\r\n"
		"1\r\n"
		"# comments\r\n"
		"2\r\n"
		"\"\"\"\r\n"
		"# comments\r\n"
		"And I have entered the following numbers into the calculator:\r\n"
		"# comments\r\n"
		"| a | b |\r\n"
		"# comments\r\n"
		"| 1 | 1 |\r\n"
		"# comments\r\n"
		"| 2 | 2 |\r\n"
		"# comments\r\n"
		"When I press add\r\n"
		"# comments\r\n"
		"Then the result should be 120 on the screen\r\n"
		"# comments\r\n"
		"Scenario Outline: Add two numbers\r\n"
		"# comments\r\n"
		"Given I have entered the numbers <a> and <b> into the calculator:\r\n"
		"# comments\r\n"
		"When I press add\r\n"
		"# comments\r\n"
		"Then the result should be 120 on the screen\r\n"
		"# comments\r\n"
		"Examples:\r\n"
		"# comments\r\n"
		"| a | b |\r\n"
		"# comments\r\n"
		"| 1 | 1 |\r\n"
		"# comments\r\n"
		"| 2 | 2 |\r\n"
		"# comments\r\n"
		"@data\r\n"
		"# comments\r\n"
		"Scenario: Add two numbers\r\n"
		"# comments\r\n"
		"Given I have entered 50 into the calculator\r\n"
		"# comments\r\n"
		"And I have entered 70 into the calculator\r\n"
		"# comments\r\n"
		"When I press add\r\n"
		"# comments\r\n"
		"Then the result should be 120 on the screen\r\n"
		"# comments\r\n"
	>>;
source(_) ->
	<<>>.

lexer_output(simple_scenario) ->
	[
		feature_keyword, <<"Addition">>, crlf,
		scenario_keyword, <<"Add two numbers">>, crlf,
		given_keyword, <<"I have entered 50 into the calculator">>, crlf,
		and_keyword, <<"I have entered 70 into the calculator">>, crlf,
		when_keyword, <<"I press add">>, crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf
	];
lexer_output(background) ->
	[
		feature_keyword, <<"Addition">>, crlf,
		background_keyword, crlf,
		given_keyword, <<"I have entered 50 into the calculator">>, crlf,
		and_keyword, <<"I have entered 70 into the calculator">>, crlf,
		when_keyword, <<"I press add">>, crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf,
		scenario_keyword, <<"Add two numbers">>, crlf,
		given_keyword, <<"I have entered 50 into the calculator">>, crlf,
		and_keyword, <<"I have entered 70 into the calculator">>, crlf,
		when_keyword, <<"I press add">>, crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf
	];
lexer_output(datatable_step) ->
	[
		feature_keyword, <<"Addition">>, crlf,
		scenario_keyword, <<"Add two numbers">>, crlf,
		given_keyword, <<"I have entered the following numbers into the calculator:">>, crlf,
			<<"| a | b |">>, crlf,
			<<"| 1 | 1 |">>, crlf,
			<<"| 2 | 2 |">>, crlf,
		when_keyword, <<"I press add">>, crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf
	];
lexer_output(docstring_step) ->
	[
		feature_keyword, <<"Addition">>, crlf,
		scenario_keyword, <<"Add two numbers">>, crlf,
		given_keyword, <<"I have entered the following numbers into the calculator:">>, crlf,
			docstring_keyword, crlf,
			<<"1">>, crlf,
			<<"2">>, crlf,
			docstring_keyword, crlf,
		when_keyword, <<"I press add">>, crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf
	];
lexer_output(scenario_outline) ->
	[
		feature_keyword, <<"Addition">>, crlf,
		scenario_outline_keyword, <<"Add two numbers">>, crlf,
		given_keyword, <<"I have entered the numbers <a> and <b> into the calculator:">>, crlf,
		when_keyword, <<"I press add">>, crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf,
		examples_keyword, crlf,
			<<"| a | b |">>, crlf,
			<<"| 1 | 1 |">>, crlf,
			<<"| 2 | 2 |">>, crlf
	];
lexer_output(feature_tags) ->
	[
		at_sign, <<"critical">>, crlf,
		at_sign, <<"non-regression">>, at_sign, <<"ui">>, crlf,
		feature_keyword, <<"Addition">>, crlf,
		scenario_keyword, <<"Add two numbers">>, crlf,
		given_keyword, <<"I have entered 50 into the calculator">>, crlf,
		and_keyword, <<"I have entered 70 into the calculator">>, crlf,
		when_keyword, <<"I press add">>, crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf
	];
lexer_output(scenario_tags) ->
	[
		feature_keyword, <<"Addition">>, crlf,
		at_sign, <<"critical">>, crlf,
		at_sign, <<"non-regression">>, at_sign, <<"ui">>, crlf,
		scenario_keyword, <<"Add two numbers">>, crlf,
		given_keyword, <<"I have entered 50 into the calculator">>, crlf,
		and_keyword, <<"I have entered 70 into the calculator">>, crlf,
		when_keyword, <<"I press add">>, crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf
	];
lexer_output(multiple_scenarios) ->
	[
		at_sign, <<"critical">>, crlf,
		feature_keyword, <<"Addition">>, crlf,

		at_sign, <<"ui">>, crlf,
		scenario_keyword, <<"Add two numbers">>, crlf,
		given_keyword, <<"I have entered the following numbers into the calculator:">>, crlf,
			docstring_keyword, crlf,
			<<"1">>, crlf,
			<<"2">>, crlf,
			docstring_keyword, crlf,
		and_keyword, <<"I have entered the following numbers into the calculator:">>, crlf,
			<<"| a | b |">>, crlf,
			<<"| 1 | 1 |">>, crlf,
			<<"| 2 | 2 |">>, crlf,
		when_keyword, <<"I press add">>, crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf,

		scenario_outline_keyword, <<"Add two numbers">>, crlf,
		given_keyword, <<"I have entered the numbers <a> and <b> into the calculator:">>, crlf,
		when_keyword, <<"I press add">>, crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf,
		examples_keyword, crlf,
			<<"| a | b |">>, crlf,
			<<"| 1 | 1 |">>, crlf,
			<<"| 2 | 2 |">>, crlf,

		at_sign, <<"data">>, crlf,
		scenario_keyword, <<"Add two numbers">>, crlf,
		given_keyword, <<"I have entered 50 into the calculator">>, crlf,
		and_keyword, <<"I have entered 70 into the calculator">>, crlf,
		when_keyword, <<"I press add">>, crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf
	];
lexer_output(lots_of_crlfs) ->
	[
		crlf,
		at_sign, <<"critical">>, crlf,
		crlf,
		feature_keyword, <<"Addition">>, crlf,
		crlf,
		background_keyword, crlf,
		crlf,
		given_keyword, <<"I have entered 50 into the calculator">>, crlf,
		crlf,
		and_keyword, <<"I have entered 70 into the calculator">>, crlf,
		crlf,
		when_keyword, <<"I press add">>, crlf,
		crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf,
		crlf,
		at_sign, <<"ui">>, crlf,
		crlf,
		scenario_keyword, <<"Add two numbers">>, crlf,
		crlf,
		given_keyword, <<"I have entered the following numbers into the calculator:">>, crlf,
		crlf,
			docstring_keyword, crlf,
			<<"1">>, crlf,
		crlf,
			<<"2">>, crlf,
			docstring_keyword, crlf,
		crlf,
		and_keyword, <<"I have entered the following numbers into the calculator:">>, crlf,
		crlf,
			<<"| a | b |">>, crlf,
		crlf,
			<<"| 1 | 1 |">>, crlf,
		crlf,
			<<"| 2 | 2 |">>, crlf,
		crlf,
		when_keyword, <<"I press add">>, crlf,
		crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf,
		crlf,
		scenario_outline_keyword, <<"Add two numbers">>, crlf,
		crlf,
		given_keyword, <<"I have entered the numbers <a> and <b> into the calculator:">>, crlf,
		crlf,
		when_keyword, <<"I press add">>, crlf,
		crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf,
		crlf,
		examples_keyword, crlf,
		crlf,
			<<"| a | b |">>, crlf,
		crlf,
			<<"| 1 | 1 |">>, crlf,
		crlf,
			<<"| 2 | 2 |">>, crlf,
		crlf,
		at_sign, <<"data">>, crlf,
		crlf,
		scenario_keyword, <<"Add two numbers">>, crlf,
		crlf,
		given_keyword, <<"I have entered 50 into the calculator">>, crlf,
		crlf,
		and_keyword, <<"I have entered 70 into the calculator">>, crlf,
		crlf,
		when_keyword, <<"I press add">>, crlf,
		crlf,
		then_keyword, <<"the result should be 120 on the screen">>, crlf,
		crlf
	];
lexer_output(lots_of_comments) ->
	lexer_output(lots_of_crlfs);
lexer_output(_) ->
	[].

parse_output(simple_scenario) ->
	{
		[],
		[],
        <<"Addition">>,
		[],
		null,
		[
			{2, <<"Add two numbers">>, [], [
				{3,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"50">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {4,and_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"70">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {5,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {6,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}
			]}
		]
	};
parse_output(background) ->
	{
		[],
		[],
        <<"Addition">>,
		[],
		{2,
			[{3,given_keyword,
			[<<"I">>,<<"have">>,<<"entered">>,<<"50">>,<<"into">>,
				<<"the">>,<<"calculator">>]},
			{4,and_keyword,
			[<<"I">>,<<"have">>,<<"entered">>,<<"70">>,<<"into">>,
				<<"the">>,<<"calculator">>]},
			{5,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
			{6,then_keyword,
			[<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
				<<"on">>,<<"the">>,<<"screen">>]}]},
		[
			{7, <<"Add two numbers">>, [], [
				{8,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"50">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {9,and_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"70">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {10,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {11,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}
			]}
		]
	};
parse_output(datatable_step) ->
	{
		[],
		[],
        <<"Addition">>,
		[],
		null,
		[
			{2, <<"Add two numbers">>, [], [
				{3,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"the">>,<<"following">>,
				  <<"numbers">>,<<"into">>,<<"the">>,<<"calculator:">>],
                 {datatable,[<<"a">>,<<"b">>],
                          [[{<<"a">>,<<"1">>},{<<"b">>,<<"1">>}],
                           [{<<"a">>,<<"2">>},{<<"b">>,<<"2">>}]]}},
                {7,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {8,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}
			]}
		]
	};
parse_output(docstring_step) ->
	{
		[],
		[],
        <<"Addition">>,
		[],
		null,
		[
			{2, <<"Add two numbers">>, [], [
				{3,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"the">>,<<"following">>,
				  <<"numbers">>,<<"into">>,<<"the">>,<<"calculator:">>],
				 {docstring, [<<"1">>,<<"2">>]}},
                {8,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {9,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}
			]}
		]
	};
parse_output(scenario_outline) ->
	{
		[],
		[],
        <<"Addition">>,
		[],
		null,
		[
			{2, <<"Add two numbers">>, [], [
				{3,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"the">>,<<"numbers">>,
				 <<"<a>">>,<<"and">>,<<"<b>">>,<<"into">>,<<"the">>,<<"calculator:">>]},
                {4,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {5,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}
			],
			{datatable,[<<"a">>,<<"b">>],
                          [[{<<"a">>,<<"1">>},{<<"b">>,<<"1">>}],
                           [{<<"a">>,<<"2">>},{<<"b">>,<<"2">>}]]}}
		]
	};
parse_output(feature_tags) ->
	{
		[],
		[{1,<<"critical">>},{2,<<"non-regression">>},{2,<<"ui">>}],
        <<"Addition">>,
		[],
		null,
		[
			{4, <<"Add two numbers">>, [], [
				{5,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"50">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {6,and_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"70">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {7,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {8,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}
			]}
		]
	};
parse_output(scenario_tags) ->
	{
		[],
		[],
        <<"Addition">>,
		[],
		null,
		[
			{4, <<"Add two numbers">>,
				[{2,<<"critical">>},{3,<<"non-regression">>},{3,<<"ui">>}],
				[
				{5,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"50">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {6,and_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"70">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {7,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {8,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}
			]}
		]
	};
parse_output(multiple_scenarios) ->
	{[],
             [{1,<<"critical">>}],
             <<"Addition">>,[],
		null,
             [{4,<<"Add two numbers">>,
               [{3,<<"ui">>}],
               [{5,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"the">>,<<"following">>,
                  <<"numbers">>,<<"into">>,<<"the">>,<<"calculator:">>],
                 {docstring,[<<"1">>,<<"2">>]}},
                {10,and_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"the">>,<<"following">>,
                  <<"numbers">>,<<"into">>,<<"the">>,<<"calculator:">>],
                 {datatable,[<<"a">>,<<"b">>],
                          [[{<<"a">>,<<"1">>},{<<"b">>,<<"1">>}],
                           [{<<"a">>,<<"2">>},{<<"b">>,<<"2">>}]]}},
                {14,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {15,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}]},
              {16,<<"Add two numbers">>,[],
               [{17,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"the">>,<<"numbers">>,
                  <<"<a>">>,<<"and">>,<<"<b>">>,<<"into">>,<<"the">>,
                  <<"calculator:">>]},
                {18,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {19,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}],
               {datatable,[<<"a">>,<<"b">>],
                          [[{<<"a">>,<<"1">>},{<<"b">>,<<"1">>}],
                           [{<<"a">>,<<"2">>},{<<"b">>,<<"2">>}]]}},
              {25,<<"Add two numbers">>,
               [{24,<<"data">>}],
               [{26,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"50">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {27,and_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"70">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {28,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {29,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}]}]};
parse_output(lots_of_crlfs) ->
	{[],
             [{2,<<"critical">>}],
             <<"Addition">>,[],
             {6,
              [{8,given_keyword,
                [<<"I">>,<<"have">>,<<"entered">>,<<"50">>,<<"into">>,
                 <<"the">>,<<"calculator">>]},
               {10,and_keyword,
                [<<"I">>,<<"have">>,<<"entered">>,<<"70">>,<<"into">>,
                 <<"the">>,<<"calculator">>]},
               {12,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
               {14,then_keyword,
                [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                 <<"on">>,<<"the">>,<<"screen">>]}]},
             [{18,<<"Add two numbers">>,
               [{16,<<"ui">>}],
               [{20,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"the">>,<<"following">>,
                  <<"numbers">>,<<"into">>,<<"the">>,<<"calculator:">>],
                 {docstring,[<<"1">>,<<"">>,<<"2">>]}},
                {28,and_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"the">>,<<"following">>,
                  <<"numbers">>,<<"into">>,<<"the">>,<<"calculator:">>],
                 {datatable,[<<"a">>,<<"b">>],
                          [[{<<"a">>,<<"1">>},{<<"b">>,<<"1">>}],
                           [{<<"a">>,<<"2">>},{<<"b">>,<<"2">>}]]}},
                {36,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {38,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}]},
              {40,<<"Add two numbers">>,[],
               [{42,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"the">>,<<"numbers">>,
                  <<"<a>">>,<<"and">>,<<"<b>">>,<<"into">>,<<"the">>,
                  <<"calculator:">>]},
                {44,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {46,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}],
               {datatable,[<<"a">>,<<"b">>],
                          [[{<<"a">>,<<"1">>},{<<"b">>,<<"1">>}],
                           [{<<"a">>,<<"2">>},{<<"b">>,<<"2">>}]]}},
              {58,<<"Add two numbers">>,
               [{56,<<"data">>}],
               [{60,given_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"50">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {62,and_keyword,
                 [<<"I">>,<<"have">>,<<"entered">>,<<"70">>,<<"into">>,
                  <<"the">>,<<"calculator">>]},
                {64,when_keyword,[<<"I">>,<<"press">>,<<"add">>]},
                {66,then_keyword,
                 [<<"the">>,<<"result">>,<<"should">>,<<"be">>,<<"120">>,
                  <<"on">>,<<"the">>,<<"screen">>]}]}]};
parse_output(_) ->
	undefined.

%%endregion
