import Array "mo:base/Array";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import Debug "mo:base/Debug";

actor {
  func sort(s : [var Int], start : Nat, end : Nat) : (){
    var i = start;
    var j = end;

    s[0] := s[start];
    while(i < j){
        while(i < j and s[0] < s[j]){
            j := j - 1;
        };
        if(i < j){
            s[i] := s[j];
            i := i + 1;
        };
        while(i < j and s[i] <= s[0]){
            i := i + 1;
        };
        if(i < j){
            s[j] := s[i];
            j := j - 1;
        };
    };

    s[i] := s[0];
    if(start < i) sort(s, start, j - 1);
    if(i < end) sort(s, j + 1, end)
  };

  func quicksort(arr : [var Int]) : (){
    if(arr.size() == 0) return;
    var res = [arr[0]];
    res := Array.append<Int>(res, Array.freeze<Int>(arr));
    var temp : [var Int] = Array.thaw<Int>(res);
    sort(temp, 1, Iter.size<Int>(Array.vals<Int>(Array.freeze<Int>(arr))));
    for(i in Iter.range(1, Iter.size<Int>(Array.vals<Int>(Array.freeze<Int>(arr))))){
        arr[i-1] := temp[i];
    };
  };

  public func qsort(arr : [Int]) : async [Int]{
      let array : [var Int] = Array.thaw(arr);
      quicksort(array);
      Array.freeze<Int>(array)
  };
}