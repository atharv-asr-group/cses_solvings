#include<iostream>
#include<vector>
#include<array>
#include<set>
#include<map>
#include<algorithm>
#include<unordered_map>
#define ll long long
using namespace std;
#define ar array
 
const int mxN=2e5;
int n;
ll x;
ll a[mxN];
int main(){
    cin>>n>>x;
    ll s=0;
    map<ll,int> mp;
    mp[0]++;
    cout<<mp[0]<<"=mp[0]  ";
    ll ans=0;
    for(int i=0;i<n;++i){
        cin>>a[i];
        s+=a[i];
        cout<<s<<" =s \n";
        cout<<s-x<<"=s-x\n";
        ans+=mp[s-x];
        cout<<ans<<"=ans\n";
        mp[s]++;
    }
    cout<<ans;
}
 