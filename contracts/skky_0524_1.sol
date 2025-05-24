interface IERC721 {
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operater, bool approved);

    function balanceOf(address owner) external view returns(uint256 balance);
    function ownerOf(uint256 tokenId) external view returns(address owner);

    function approve(address to, uint256 tokenId) external;
    function getApproved(uint256 tokenId) external view returns(address operater);

    function safeTransferFrom(address from, address to, uint256 tokenId) external;
    function TransferFrom(address from, address to, uint256 tokenId) external;

    function setApprovalForAll(address operater, bool _approved) external;    
    function isApprovedForAll(address owner, address operater) external view returns(bool); 
}
interface IERC721Receiver {
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}


//test ERC721
contract skky_0524_1 is IERC721{
    string public name;
    string public symbol;

    mapping (uint256=>address) private _owners;
    mapping (address=>uint256) private _balances;
    mapping (uint256=>address) private _tokenApprovals;
    mapping (address=>mapping(address => bool)) private _operatorApprovals;

    constructor(string memory _name, string memory _symbol){
        name = _name;
        symbol = _symbol;
    }

    function balanceOf(address owner) public view override returns (uint256){
        require(owner != address(0),"Zero address");
        return _balances[owner];
    }
    function ownerOf(uint256 tokenId) public view override returns (address){
        address owner = _owners[tokenId];
        require(owner != address(0),"Token does not exist");
        return owner;
    }
    function approve(address to, uint256 tokenId) public override {
        address owner = ownerOf(tokenId);
        require(to != owner || isApprovedForAll(owner, msg.sender),"Not authorized");
        _tokenApprovals[tokenId] = to;
        emit Approval(owner, to, tokenId);
    }
    function getApproved(uint256 tokenId) public view override returns (address){
        require(_owners[tokenId] != address(0),"Token does not exist");
        return _tokenApprovals[tokenId];
    }

    function setApprovalForAll(address operator, bool approved) public override {
        _operatorApprovals[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    function isApprovedForAll(address owner, address operator) public view override returns (bool){
        return _operatorApprovals[owner][operator];
    }

    function TransferFrom(address from, address to, uint256 tokenId) public override{
        require(_isApprovedOrOwner(msg.sender, tokenId), "Not approved or owner");
        _transfer(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public override{
        safeTransferFrom(from, to, tokenId,"");
        
    }

    function safeTransferFrom(address from, address to,uint256 tokenId, bytes memory data) public{
        require(_isApprovedOrOwner(msg.sender, tokenId), "Not approved or owner");
        _transfer(from, to, tokenId);
        require(_checkOnERC721Received( from, to, tokenId, data), "Receiver rejected");
    }
    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns(bool) {
        address owner = ownerOf(tokenId);
        return (spender == owner || getApproved(tokenId)==spender || isApprovedForAll(owner, spender));
    }

    function _transfer(address from, address to, uint256 tokenId) internal {
        require(ownerOf(tokenId)==from, "Wrong owner");
        require(to != address(0), "Transfer to zero addr");
        delete _tokenApprovals[tokenId];
        _balances[from]-=1;
        _balances[to]+=1;
        _owners[tokenId]=to;
        emit Transfer(from, to, tokenId);
    }




    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) private returns(bool){
        if (to.code.length == 0) {
            return true;
        }
        try IERC721Receiver(to).onERC721Received(msg.sender, from, tokenId, data) returns(bytes4 retval){
            return retval == IERC721Receiver(to).onERC721Received.selector;
        } catch{
            return false;
        }
    }

    function _exists(uint256 tokenId) internal view returns (bool) {
        return _owners[tokenId] != address(0);
    }

    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "Mint to zero addr");
        require(!_exists(tokenId),"Token exists");
        _owners[tokenId] = to;
        _balances[to] +=1;
        emit Transfer(address(0), to, tokenId);
    }

    function _burn(uint256 tokenId) internal{
        address owner = ownerOf(tokenId);
        delete _tokenApprovals[tokenId];
        _balances[owner]-=1;
        delete _owners[tokenId];
        emit Transfer(owner, address(0), tokenId);
    }




}