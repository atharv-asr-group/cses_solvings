#include<iostream>
#include<vector>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array
//watch out boy.
const int mxN=5e3;
ll n;
ll x;
ar<int,2> a[mxN];
int main(){
    cin>>n>>x;
    for(int i=0; i<n; ++i){
        cin>> a[i][0],a[i][1]=i;
    }
    sort(a,a+n);
    for(int i=0;i<n;++i){
        ll x2=x-a[i][0];
        for(int j=i+1, k=n-1; j<k ;++j){
            while(j<k&&a[j][0]+a[k][0]>x2){
                --k;
            }
            if(j<k&&a[j][0]+a[k][0]==x2){
                cout<<a[i][1]+1<<" "<<a[j][1]+1<<" "<<a[k][1]+1<<"\n";
                return 0;
            }
        }
    }
    cout<<"IMPOSSIBLE";
   

}