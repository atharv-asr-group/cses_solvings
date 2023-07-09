#include<iostream>
#include<vector>
#include<queue>
#include<functional>
#include<cstring>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array


const int mxN=2.5e3;
int n,m, p[mxN];
ll d[mxN], ans[mxN];
vector<ar<ll,2>> adj[mxN];
vector<int> adj2[mxN];
bool vis[mxN];
bool vis2[mxN];


int main(){
    cin >> n>>m;
    for(int i=0;i<m;++i){
        int a,b,c;
        cin>>a>>b>>c,--a,--b;
        adj[a].push_back({c, b});
        adj2[b].push_back(a);
    }
    memset(d,0xc0,sizeof(d));
    d[0]=0;
    for(int i=0;i<5*n;++i){
        bool ch=0;
        for(int j=0; j<n; ++j){
            for(ar<ll,2> a: adj[j]){
                if(d[j]+a[0]<d[a[1]]){
                    d[a[1]]=d[j]+a[0];
                    p[a[1]]=j;
                    if(i==n-1){
                        cout<<"YES\n";
                        while(!vis[j]){
                            vis[j]=1;
                            j=p[j];
                        }
                        int u=j;
                        vector<int> ans;
             
                        ans.push_back(u);
                        u=p[u];
                        while(u^j){
               
                            ans.push_back(u);
                            u=p[u];
                        }
                        ans.push_back(u);
                        reverse(ans.begin(),ans.end());
                        for(int a: ans){
                            cout<<a+1<<" ";
                        }
                        return 0;
                    }
                }
            }
        }  
    }
    cout<<"NO";
}