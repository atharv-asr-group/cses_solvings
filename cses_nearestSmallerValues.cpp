#include<iostream>
#include<vector>
#include<array>
#include<set>
#include<algorithm>
#include<unordered_map>
#define ll long long
using namespace std;
#define ar array
 
const int mxN=2e5;
int n,n1[mxN];
// ll x;
ll a[mxN];
int main(){
    cin>>n;
    for(int i=0;i<n;++i){
        cin>>a[i];
        n1[i]=i-1;
        while(~n1[i]&&a[n1[i]]>=a[i]){
            n1[i]=n1[n1[i]];
        }
        cout<< n1[i]+1<<" ";
    }
}