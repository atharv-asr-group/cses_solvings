#include<iostream>
#include<algorithm>
#include<set>
#include<array>
#define ll long long
#define ar array

using namespace std;
const int mxN=2e5;
int n,m;

int main(){
    cin>> n>> m;
    set<ar<int, 2>> s;
    for(int i=0; i<n; ++i){
        int a; 
        cin>>a;
        s.insert({a,i});
    }
    for(int i=0;i<m;++i){
        int t;
        cin>>t;
        auto it=s.lower_bound({t+1,0});
        if(it==s.begin()){
            cout<<"-1\n";
        }else{
            --it;
            cout<<(*it)[0]<<"\n";
            s.erase(it);
        }
    }
}