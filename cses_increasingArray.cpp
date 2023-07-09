#include<iostream>
#include<vector>
// #include <bits/stdc++.h>
#define ll long long
using namespace std;

int main(){
   ll x;
   ll b;
   cin>>b;
   ll mx=0;
   ll ans=0;
   for(ll i=0;i<b;i++){
    cin>>x;
    mx=max(x,mx);
    ans+=mx-x;
   }
   cout<<ans;
}