import std.stdio, std.algorithm, std.range, std.array;
 
auto quickSort(T)(T[] items) pure nothrow @safe {
    if (items.length < 2)
        return items;
    immutable pivot = items[0];
    return items[1 .. $].filter!(x => x < pivot).array.quickSort ~
           pivot ~
           items[1 .. $].filter!(x => x >= pivot).array.quickSort;
}
 
void main() {
    [1,99,2,98,3,97,4,96,4,95,5,94].quickSort.writeln;
}
