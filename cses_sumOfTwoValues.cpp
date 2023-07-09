#include<iostream>
#include<vector>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array

int n,x; 
const int mxN=2e5;


int main(){
    cin>>n>>x;
    map<int,int> mp;
    int a;
    for(int i=0;i<n;i++){
        cin>>a;
        if(mp.find(x-a)!=mp.end()){
            cout<<mp[x-a]+1<<" "<<i+1;
            return 0;
        }
        mp[a]=i;
    }
    cout<<"IMPOSSIBLE";
}