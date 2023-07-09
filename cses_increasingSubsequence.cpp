#include<iostream>
#include<vector>
#include<queue>
#include<functional>
#include<cstring>
#include<array>
#include<set>
#include<numeric>//for iota
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array
//same as tower problem

const int mxN=2e5;
int n;
int main(){
    cin>>n;
    vector<int> v;
    for(int i=0; i<n; ++i){
        int a;
        cin>>a;
        int p=lower_bound(v.begin(), v.end(), a)-v.begin();
        if(p<v.size())
            v[p]=a;
        else   
            v.push_back(a);
    }
    cout<<v.size();
}