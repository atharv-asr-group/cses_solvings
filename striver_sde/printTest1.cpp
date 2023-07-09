
// #include <bits/stdc++.h>
#include <iostream>
#include <ext/pb_ds/assoc_container.hpp>
using namespace __gnu_pbds;
using namespace std;
typedef tree<long long, null_type,
             less_equal<long long>, rb_tree_tag,
             tree_order_statistics_node_update>
    ordered_multiset;
long long cntIntersections(
    vector<pair<long long, long long> > lines,
    long long N)
{
    long long cnt = 0;
    ordered_multiset s;
    for (long long i = 0; i < N; i++) {
        cnt += s.order_of_key(lines[i].second);
        s.insert(lines[i].second);
    }
    return cnt;
}
long long cntAllIntersections(
    vector<pair<long long, long long> > lines,
    long long N)
{
    sort(lines.begin(), lines.end(),
         greater<pair<long long, long long> >());
    long long totalCnt = 0;
    totalCnt += cntIntersections(lines, N);
    for (long long i = 0; i < N; i++) {
        swap(lines[i].first, lines[i].second);
    }
    totalCnt += cntIntersections(lines, N);
    return totalCnt;
}
// Driver Code
int main()
{
    vector<pair<long long, long long>> wires;
    long long n,p,q;
    cin>>n;
    for(long long i=0;i<n;i++){
        cin>>p>>q;
        wires.push_back({p,q});
    }
    cout << cntAllIntersections(wires,
                                wires.size());
    return 0;
}