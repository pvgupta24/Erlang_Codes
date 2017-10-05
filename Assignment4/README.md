# **Assignment 2**
<table border=3>
<tr>
<th>Function</th>
<th>Parameters</th>
<th>Description</th>
</tr>

<tr>
<td>for</td>
<td>(I, Pred, Update, Body)</td>
<td>
For loop construct with Start value = I , Loop update = Update , Loop body = Body

</td></tr>

<tr>
<td>index</td>
<td>(List, Key, Pred)</td>
<td>
Returns position of key in list if it sastisfes Predicate.
</td></tr>

<tr>
<td>for_all</td>
<td>(List,Pred)</td>
<td>
Tells if all elements of List satisfy Pred.

</td></tr>

<tr>
<td>there_exists</td>
<td>(List,Pred)</td>
<td>
Tells if there exists an element in List satisfying Pred.
</td></tr>

<tr>
<td>there_exists2</td>
<td>(List,Pred)</td>
<td>
Tells if there exists exactly 2 elements in List satisfying Pred.
</td></tr>

<tr>
<td>foldl</td>
<td>(Function,List)</td>
<td>
Accumulator operating from head to last.

</td></tr>

<tr>
<td>foldr</td>
<td>(Function,List)</td>
<td>
Accumulator operating from last to head.

</td></tr>

<tr>
<td>filterl</td>
<td>(Pred, List)</td>
<td>
Filters the List with Pred condition using foldl.

</td></tr>

<tr>
<td>filterr</td>
<td>(Pred, List)</td>
<td>
Filters the List with Pred condition using foldr.

</td></tr>

<tr>
<td>scanl</td>
<td>(Function,List)</td>
<td>
Fold from head to last giving all intermediate states.

</td></tr>

<tr>
<td>scanr</td>
<td>(Function,List)</td>
<td>
Fold from last to head giving all intermediate states.

</td></tr>

<tr>
<td>rem_dupsl</td>
<td>()</td>
<td>Removes adjacent duplicate using foldl.

</td></tr>

<tr>
<td>rem_dupsr</td>
<td>(List)</td>
<td>Removes adjacent duplicate using foldr.

</td></tr>
<tr>
<td>qsort</td>
<td>(List)</td>
<td>
Quick Sort using filterl.
</td></tr>

<tr>
<td>sum_square</td>
<td>(List)</td>
<td>
Sum of squares of even elements than can be expressed as a sum of 2 prime numbers.<br>
Goldbach Conjecture : Every even number greater than can be expressed as a sum of 2 prime numbers.
</td></tr>

<tr>
<td>takewhile</td>
<td>(Pred,List)</td>
<td>Returns the longest prefix of the list for which all elements satisfy the predicate.

</td></tr>

<tr>
<td>exceed1000</td>
<td>()</td>
<td>No of consecutive natural numbers for sum of the square roots to exceed 1000 using scanl and takewhile.

</td></tr>

<tr>
<td>size_subset</td>
<td>(List,S)</td>
<td>Size of minimum subset on List such that sum is >= S.

</td></tr>


</table>
