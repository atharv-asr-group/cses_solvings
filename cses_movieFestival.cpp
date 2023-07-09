#include<iostream>
#include<vector>
#include<array>
#include<set>
#include<algorithm>
#define ll long long
using namespace std;
#define ar array
int n,m;   
const int mxN=2e5;
ar<int,2> a[mxN];
//not able to understand the logic
int main(){
    cin>>n;
    for(int i=0; i<n; ++i){
        cin>>a[i][1]>>a[i][0];
    }
    sort(a,a+n);
    int ans=0, l=0;
    for(int i=0; i<n; ++i){
        cout<<a[i][0];
        if(a[i][1]>=l){
            ++ans;
            l=a[i][0];
        }
    }
    cout << ans;
}