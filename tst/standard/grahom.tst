#############################################################################
##
#W  standard/grahom.tst
#Y  Copyright (C) 2015                                   Wilfred A. Wilson
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Digraphs package: standard/grahom.tst");
gap> LoadPackage("digraphs", false);;

#
gap> DIGRAPHS_StartTest();

#T# HomomorphismGraphsFinder: checking errors and robustness
gap> HomomorphismGraphsFinder(0, 0, 0, 0, 0, 0, 0, 0);
Error, Function Calls: number of arguments must be 9 (not 8)
gap> HomomorphismGraphsFinder(0, 0, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 1st and 2nd arguments <gr1> and <gr2> must be digraphs,
gap> gr1 := ChainDigraph(2);;
gap> gr2 := CompleteDigraph(3);;
gap> HomomorphismGraphsFinder(0, gr2, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 1st and 2nd arguments <gr1> and <gr2> must be digraphs,
gap> HomomorphismGraphsFinder(gr1, 0, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 1st and 2nd arguments <gr1> and <gr2> must be digraphs,
gap> HomomorphismGraphsFinder(gr1, gr2, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: error,
not yet implemented for non-symmetric digraphs,
gap> HomomorphismGraphsFinder(gr2, gr1, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: error,
not yet implemented for non-symmetric digraphs,
gap> gr1 := CompleteDigraph(2);;
gap> HomomorphismGraphsFinder(gr1, gr2, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 3rd argument <hook> has to be a function with 2 arguments,
gap> HomomorphismGraphsFinder(gr1, gr2, IsTournament, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 3rd argument <hook> has to be a function with 2 arguments,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 4th argument <user_param> must be a list,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, "a", 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 5th argument <limit> has to be a positive integer or infinity,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, "a", "a", 0, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 5th argument <limit> has to be a positive integer or infinity,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, "a", 1, 0, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 6th argument <hint> has to be a positive integer or fail,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, "a", 1, 1, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 7th argument <isinjective> has to be a true or false,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, "a", infinity, fail, 0, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 7th argument <isinjective> has to be a true or false,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, "a", infinity, 2, true, 0, 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 1, true, [1, []], 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 1, true, [[], []], 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 1, true, [0, 1], 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 1, true, [4, 4], 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismGraphsFinder(gr2, gr1, fail, [], 1, 1, true, [3], 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 1, true, [3], 0);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 9th argument <map> must be a list of vertices of the 8th argument <image>
which is no longer than the number of vertices of the 1st argument <gr1>,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 1, true, [3], [1 .. 4]);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 9th argument <map> must be a list of vertices of the 8th argument <image>
which is no longer than the number of vertices of the 1st argument <gr1>,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 1, true, [], [1, 2, 3, 2]);
Error, Digraphs: HomomorphismGraphsFinder: usage,
the 9th argument <map> must be a list of vertices of the 8th argument <image>
which is no longer than the number of vertices of the 1st argument <gr1>,
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 1, true, [1], [1]);
[  ]
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 2, true, [1, 2], [1]);
[  ]
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 3, false, [1, 2], [1]);
[  ]
gap> HomomorphismGraphsFinder(gr2, gr1, fail, [], 1, 3, false, [1, 2], [1]);
[  ]
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 1, false, [], []);
[  ]
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 1, false, [1, 2], []);
[  ]
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 1, false, [1, 2], []);
[  ]
gap> HomomorphismGraphsFinder(gr1, gr2, fail, [], 1, 2, false, [1], []);
[  ]
gap> HomomorphismGraphsFinder(gr1, gr1, fail, [], 1, 2, false, [1, 2], []);
[ IdentityTransformation ]
gap> gr := CompleteDigraph(513);;
gap> HomomorphismGraphsFinder(gr, gr, fail, [], 1, fail, false, [1 .. 513], []);
Error, Digraphs: HomomorphismGraphsFinder: error,
not yet implemented for digraphs with more than 512 vertices,

#T# GeneratorsOfEndomorphismMonoid: checking errors and robustness
gap> gr := ChainDigraph(2);
<digraph with 2 vertices, 1 edge>
gap> GeneratorsOfEndomorphismMonoid();
Error, Digraphs: GeneratorsOfEndomorphismMonoid: usage,
this function takes at least one argument,
gap> GeneratorsOfEndomorphismMonoid(Group(()));
Error, Digraphs: GeneratorsOfEndomorphismMonoid: usage,
the 1st argument <digraph> must be a digraph,
gap> GeneratorsOfEndomorphismMonoid(gr);
Error, Digraphs: GeneratorsOfEndomorphismMonoid: error,
not yet implemented for non-symmetric digraphs,
gap> gr := DigraphTransitiveClosure(CompleteDigraph(2));
<digraph with 2 vertices, 4 edges>
gap> DigraphHasLoops(gr);
true
gap> GeneratorsOfEndomorphismMonoid(gr);
Error, Digraphs: GeneratorsOfEndomorphismMonoid: error,
not yet implemented for digraphs with loops,
gap> gr := EmptyDigraph(2);
<digraph with 2 vertices, 0 edges>
gap> GeneratorsOfEndomorphismMonoid(gr, Group(()), Group((1, 2)));
[ Transformation( [ 2, 1 ] ), IdentityTransformation, 
  Transformation( [ 1, 1 ] ) ]
gap> gr := EmptyDigraph(2);;
gap> GeneratorsOfEndomorphismMonoid(gr, Group(()));
[ Transformation( [ 2, 1 ] ), IdentityTransformation, 
  Transformation( [ 1, 1 ] ) ]
gap> gr := EmptyDigraph(2);;
gap> GeneratorsOfEndomorphismMonoid(gr, 1);
[ Transformation( [ 2, 1 ] ) ]
gap> gr := EmptyDigraph(2);;
gap> GeneratorsOfEndomorphismMonoid(gr, 2);
[ Transformation( [ 2, 1 ] ), IdentityTransformation ]
gap> gr := EmptyDigraph(2);;
gap> GeneratorsOfEndomorphismMonoidAttr(gr);;
gap> GeneratorsOfEndomorphismMonoid(gr, 4) = last;
true
gap> gens := GeneratorsOfEndomorphismMonoid(gr, 3);
[ Transformation( [ 2, 1 ] ), IdentityTransformation, 
  Transformation( [ 1, 1 ] ) ]
gap> IsFullTransformationSemigroup(Semigroup(gens));
true
gap> Size(Semigroup(gens));
4

#T# DigraphColoring and DigraphColouring: checking errors and robustness
gap> gr := Digraph([[2, 2], []]);
<multidigraph with 2 vertices, 2 edges>
gap> DigraphColouring(gr, 1);
Error, Digraphs: DigraphColoring: usage,
the 1st argument <digraph> must not be a  multidigraph,
gap> gr := EmptyDigraph(3);
<digraph with 3 vertices, 0 edges>
gap> DigraphColoring(gr, 4);
fail

# the following don't work because injective homos are not yet done
#gap> DigraphColoring(gr, 3);
#IdentityTransformation
#gap> DigraphColoring(gr, 2);
#Transformation( [ 1, 2, 1 ] )
#gap> DigraphColoring(gr, 1);
#Transformation( [ 1, 1, 1 ] )
#gap> gr := CompleteDigraph(3);
#<digraph with 3 vertices, 6 edges>
#gap> DigraphColoring(gr, 1);
#fail
#gap> DigraphColoring(gr, 2);
#fail
#gap> DigraphColoring(gr, 3);

#T# MonomorphismGraphs
gap> gr1 := EmptyDigraph(1);;
gap> MonomorphismGraphs(gr1, gr1);
()
gap> gr2 := EmptyDigraph(2);;
gap> MonomorphismGraphs(gr2, gr1);
fail

# the following currently returns fail, even though it should not
# this is because the injective homos code is not yet done
#gap> MonomorphismGraphs(gr1, gr2);

# the following currently returns fail, even though it should not
# this is because the injective homos code is not yet done
#gap> MonomorphismGraphs(CompleteDigraph(2), Digraph([[2],[1,3],[2]]));

#T# DIGRAPHS_UnbindVariables
gap> Unbind(gr);
gap> Unbind(gr1);
gap> Unbind(gr2);

#E#
gap> STOP_TEST("Digraphs package: standard/grahom.tst");
