Requirements for khargosh

/* -- usage : 
1. xxx(function name)

   - Action: on the xxx page, the user should be able to xxx(e.g. mint NFT)
   - Reaction: the webisite should....

2. xxx
   - Action:
   - Reaction:
----
*/

I believe there are two contract requirement, one for the fungible, one for non fungible. (CMIIW) 

A. FUNGIBLE
  1. DailyClaim()
     - Action: Every minted NFT are eligible for claiming certain Amount of Token Daily
     - Reaction: New amount of fungible token are alocated daily for Each NFT owned by owner address
  2. withNFTMint()
     - Action: Every newly minted NFT are eligible for claiming Start Amount of Token 
     - Reaction: New Minted NFT are alocated for certain amount of starter pack Token that could be claimed later. 
  3. /** -- other standard openzeplin fungible smart contract methods -- **/

B. Non FUNGIBLE
  1. mint()
     - Action: Create New NFT from blackholes (nothing) to a wallet.  
     - Reaction: New Minted NFT are collected into the owner wallet.  
  2. breed()
     - Action: Require Odd and Even ID of two NFT and certain amount of Fungible Token. 
     - Reaction: mint() new NFT from the Parent NFT, sent to the owner wallet. 
  3. /** -- other standard openzeplin non-fungible smart contract methods -- **/

