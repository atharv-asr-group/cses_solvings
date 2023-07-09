#include<iostream>
#include<vector>
#include<array>
#include<set>
#define ll long long
using namespace std;
#define ar array
int n,m; 
int main(){
    cin>>n;
    set<ar<int,2>> s;
    for(int i=0;i<n;i++){
        int a,b;
        cin>>a>>b;
        s.insert({2*a,1});
        s.insert({2*b+1,-1});
    }
    int ans=0,c=0;
    for(ar<int, 2> a: s){
        c+=a[1];
        ans=max(c,ans);
    }
    cout<<ans;
}