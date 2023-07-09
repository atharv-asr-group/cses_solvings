
#include <iostream>
#include <ext/pb_ds/assoc_container.hpp>
using namespace __gnu_pbds;
using namespace std;
 
typedef tree<long long, null_type,
             less_equal<long long>, rb_tree_tag,
             tree_order_statistics_node_update>
    ordered_multiset;

int main()
{
    vector<pair<long long, long long>> wires;
    long long n,p,q;
    cin>>n;
    for(long long i=0;i<n;i++){
        cin>>p>>q;
        wires.push_back({p,q});
    }
    long long tmpcount = 0;
    long long totalCount = 0;

    sort(wires.begin(), wires.end(),greater<pair<long long, long long> >());
 
    ordered_multiset arr;
 
    for (long long i = 0; i < wires.size(); i++) {
        tmpcount += arr.order_of_key(wires[i].second);
        arr.insert(wires[i].second);
    }
    totalCount+=tmpcount;
    cout << totalCount;
    return 0;
}