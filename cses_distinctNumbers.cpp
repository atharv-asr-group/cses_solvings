#include<iostream>
#include<algorithm>
#include<set>
#define ll long long
using namespace std;

int main(){
    ll n;
    cin>>n;
    ll a;
    set<int> s;
    for(int i=0;i<n;i++){
        cin>>a;
        s.insert(a);
    }
    cout<<s.size();
   
}