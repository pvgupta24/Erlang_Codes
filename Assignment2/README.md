# **Assignment 2**
<table border=3>
<tr>
<th>Function</th>
<th>Parameters</th>
<th>Description</th>
</tr>

<tr>
<td>unique</td>
<td>(List)</td>
<td>Takes a List and returns the list without repetition of elements.</td>
</tr>

<tr>
<td>uniq</td>
<td>(List)</td>
<td>Takes  List and returns the list containing only unique elements.</td>
</tr>

<tr>
<td>freq</td>
<td>(Element,List)</td>
<td>Takes a List and returns the count of an element in the list.</td>
</tr>

<tr>
<td>replicate</td>
<td>(Frequency,Element)</td>
<td>Returns a list containing an element with desired repetions.
</td>
</tr>

<tr>
<td>rep</td>
<td>(Frequency,Element)</td>
<td>Another approach for replicate.</td>
</tr>

<tr>
<td>reverse</td>
<td>(List)</td>
<td>Takes a list and returns its reverse list.</td>
</tr>

<tr>
<td>zip</td>
<td>(List1,List2)</td>
<td>Takes 2 list and returns a list with tuples of corresponding elements.</td>
</tr>

<tr>
<td>zipp</td>
<td>(List1,List2)</td>
<td>Another approach for zip</td>
</tr>

<tr>
<td>fac</td>
<td>(Number)</td>
<td>Returns factorial of given no.</td>
</tr>

<tr>
<td>fact</td>
<td>(Number)</td>
<td>Another approach for factorial using tail recursion.</td>
</tr>

<tr>
<td>fibb</td>
<td>(No_Of_Terms)</td>
<td>Prints N elements of the fibonacci series.</td>
</tr>

<tr>
<td>fibTerm</td>
<td>(N)</td>
<td>Prints Nth term of the fibonacci series.</td>
</tr>

<tr>
<td>fibTimer</td>
<td>()</td>
<td>Gives time taken by the fibonacci functions.</td>
</tr>

<tr>
<td>fib</td>
<td>(No_Of_Terms)</td>
<td>Prints N elements of the fibonacci series using tail recursion.</td>
</tr>

<tr>
<td>bsort</td>
<td>(List)</td>
<td>Sorts the given list using bubble sort algorithm.</td>
</tr>

<tr>
<td>isort</td>
<td>(List)</td>
<td>Sorts the given list using insertion sort algorithm.</td>
</tr>

<tr>
<td>ssort</td>
<td>(List)</td>
<td>Sorts the given list using selection sort algorithm.</td>
</tr>

<tr>
<td>msort</td>
<td>(List)</td>
<td>Sorts the given list using merge sort algorithm.</td>
</tr>

<tr>
<td>merge</td>
<td>(List1,List2)</td>
<td>Merges 2 sorted lists into 1 sorted list</td>
</tr>

<tr>
<td>qsort</td>
<td>(List)</td>
<td>Sorts the given list using quick sort algorithm.</td>
</tr>

<tr>
<td>timer</td>
<td>()</td>
<td>Gives the sorting time for the different search algorithms</tr>

<tr>
<td>randList</td>
<td>(No._Of_Elements)</td>
<td>Returns a list containing N random elements.</tr>

</table>

**Time Taken**
<pre>
assign2:sortTimer().
       1 elements : 0.000000 seconds by merge sort
       1 elements : 0.000000 seconds by quick sort
       1 elements : 0.000000 seconds by insertion sort
       1 elements : 0.000000 seconds by bubble sort
       1 elements : 0.000000 seconds by selection sort
      10 elements : 0.000000 seconds by merge sort
      10 elements : 0.000000 seconds by quick sort
      10 elements : 0.000000 seconds by insertion sort
      10 elements : 0.000000 seconds by bubble sort
      10 elements : 0.000000 seconds by selection sort
     100 elements : 0.000000 seconds by merge sort
     100 elements : 0.000000 seconds by quick sort
     100 elements : 0.000000 seconds by insertion sort
     100 elements : 0.000000 seconds by bubble sort
     100 elements : 0.000000 seconds by selection sort
    1000 elements : 0.000000 seconds by merge sort
    1000 elements : 0.000000 seconds by quick sort
    1000 elements : 0.016000 seconds by insertion sort
    1000 elements : 0.719000 seconds by bubble sort
    1000 elements : 0.765000 seconds by selection sort
   10000 elements : 0.000000 seconds by merge sort
   10000 elements : 0.031000 seconds by quick sort
   10000 elements : 1.297000 seconds by insertion sort
Time Limit(60s) Exceeded for 10000 elements for bubble sort
Time Limit(60s) Exceeded for 10000 elements for selection sort
  100000 elements : 0.109000 seconds by merge sort
  100000 elements : 3.094002 seconds by quick sort
Time Limit(60s) Exceeded for 100000 elements for insertion sort
 1000000 elements : 1.577997 seconds by merge sort
Time Limit(60s) Exceeded for 1000000 elements for quick sort
Time Limit(60s) Exceeded for 10000000 elements for merge sort
Limit Exceeded 100000000 > 10000000

=======================================================================

assign2:fibTimer().
        1 elements : 0.000000 seconds with Tail Recursion.
        1 elements : 0.000000 seconds without Tail Recursion.
        2 elements : 0.000000 seconds with Tail Recursion.
        2 elements : 0.000000 seconds without Tail Recursion.
        4 elements : 0.000000 seconds with Tail Recursion.
        4 elements : 0.000000 seconds without Tail Recursion.
        8 elements : 0.000000 seconds with Tail Recursion.
        8 elements : 0.000000 seconds without Tail Recursion.
       16 elements : 0.000000 seconds with Tail Recursion.
       16 elements : 0.000000 seconds without Tail Recursion.
       32 elements : 0.000000 seconds with Tail Recursion.
       32 elements : 0.000000 seconds without Tail Recursion.
       64 elements : 0.000000 seconds with Tail Recursion.
       64 elements : 0.000000 seconds without Tail Recursion.
      128 elements : 0.000000 seconds with Tail Recursion.
      128 elements : 0.000000 seconds without Tail Recursion.
      256 elements : 0.000000 seconds with Tail Recursion.
      256 elements : 0.000000 seconds without Tail Recursion.
      512 elements : 0.000000 seconds with Tail Recursion.
      512 elements : 0.000000 seconds without Tail Recursion.
     1024 elements : 0.000000 seconds with Tail Recursion.
     1024 elements : 0.000000 seconds without Tail Recursion.
     2048 elements : 0.000000 seconds with Tail Recursion.
     2048 elements : 0.000000 seconds without Tail Recursion.
     4096 elements : 0.000000 seconds with Tail Recursion.
     4096 elements : 0.000000 seconds without Tail Recursion.
     8192 elements : 0.000000 seconds with Tail Recursion.
     8192 elements : 0.016000 seconds without Tail Recursion.
    16384 elements : 0.015000 seconds with Tail Recursion.
    16384 elements : 0.032000 seconds without Tail Recursion.
    32768 elements : 0.093000 seconds with Tail Recursion.
    32768 elements : 0.235000 seconds without Tail Recursion.
    65536 elements : 0.562000 seconds with Tail Recursion.
    65536 elements : 0.250000 seconds without Tail Recursion.
Limit reached 131072>100000 .

</pre>
