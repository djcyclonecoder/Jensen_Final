
    using Microsoft.AspNetCore.Authorization;
    using System.IdentityModel.Tokens.Jwt;
    using System.Text;
    using Microsoft.IdentityModel.Tokens;
    using System.Security.Claims;

    namespace Jensen_Final
    {
        public class JWTAuthenticationManager
        {
            //key declaration
            private readonly string key;

            
            // User list
            private readonly IDictionary<string, string> users = new Dictionary<string, string>()
            { {"DMV", "DMVPWD"}, {"LAW", "LAWPWD"}, {"ADMIN", "PWD"}, {"logout", "logout"} };

            public JWTAuthenticationManager(string key)
            {
                this.key = key;
            }

        public string Authenticate(string username, string password)
        {
            //auth failed - creds incorrect
            if (!users.Any(u => u.Key == username && u.Value == password))
            {
                return null;
            }
            JwtSecurityTokenHandler tokenHandler = new JwtSecurityTokenHandler();
            var tokenKey = Encoding.ASCII.GetBytes(key);

            // ======== DMV Authorization ===========
            if (username == "DMV")
            {
                Console.WriteLine("DMV");


                SecurityTokenDescriptor tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(new Claim[]
                        {
                    new Claim(ClaimTypes.Name, username),
                    new Claim(ClaimTypes.Role, "DMV")

                        }),
                    //set duration of token here
                    Expires = DateTime.UtcNow.AddHours(1),
                    SigningCredentials = new SigningCredentials(
                            new SymmetricSecurityKey(tokenKey),
                            SecurityAlgorithms.HmacSha256Signature) //setting sha256 algorithm
                };

                var token = tokenHandler.CreateToken(tokenDescriptor);

                return tokenHandler.WriteToken(token);

            }
            // ======== LAW Authorization ===========
            else if (username == "LAW")
            {
                Console.WriteLine("LAW");


                SecurityTokenDescriptor tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(new Claim[]
                        {
                    new Claim(ClaimTypes.Name, username),
                    new Claim(ClaimTypes.Role, "LAW")

                        }),
                    //set duration of token here
                    Expires = DateTime.UtcNow.AddHours(1),
                    SigningCredentials = new SigningCredentials(
                            new SymmetricSecurityKey(tokenKey),
                            SecurityAlgorithms.HmacSha256Signature) //setting sha256 algorithm
                };

                var token = tokenHandler.CreateToken(tokenDescriptor);

                return tokenHandler.WriteToken(token);

            }
            // ======== ADMIN Authorization ===========
            else if (username == "ADMIN")
            {
                Console.WriteLine("ADMIN");


                SecurityTokenDescriptor tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(new Claim[]
                        {
                    new Claim(ClaimTypes.Name, username),
                    new Claim(ClaimTypes.Role, "ADMIN")

                        }),
                    //set duration of token here
                    Expires = DateTime.UtcNow.AddHours(1),
                    SigningCredentials = new SigningCredentials(
                            new SymmetricSecurityKey(tokenKey),
                            SecurityAlgorithms.HmacSha256Signature) //setting sha256 algorithm
                };

                var token = tokenHandler.CreateToken(tokenDescriptor);

                return tokenHandler.WriteToken(token);

            }
            // ======== 'logout' Authorization ===========
            else if (username == "logout")
            {
                Console.WriteLine("logout");

                SecurityTokenDescriptor tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(new Claim[]
                        {
                    new Claim(ClaimTypes.Name, username),
                    // new Claim(ClaimTypes.Role, "ADMIN")

                        }),
                    //set duration of token here
                    Expires = DateTime.UtcNow.AddSeconds(1),
                    SigningCredentials = new SigningCredentials(
                            new SymmetricSecurityKey(tokenKey),
                            SecurityAlgorithms.HmacSha256Signature) //setting sha256 algorithm
                };

                var token = tokenHandler.CreateToken(tokenDescriptor);

                return tokenHandler.WriteToken(token);
            }
            else
            {
                // Console.WriteLine("logout");

                SecurityTokenDescriptor tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(new Claim[]
                        {
                    new Claim(ClaimTypes.Name, username),
                    // new Claim(ClaimTypes.Role, "ADMIN")

                        }),
                    //set duration of token here
                    Expires = DateTime.UtcNow.AddSeconds(1),
                    SigningCredentials = new SigningCredentials(
                            new SymmetricSecurityKey(tokenKey),
                            SecurityAlgorithms.HmacSha256Signature) //setting sha256 algorithm
                };

                var token = tokenHandler.CreateToken(tokenDescriptor);

                return tokenHandler.WriteToken(token);
            }



            // var token = tokenHandler.CreateToken(tokenDescriptor);

            // return tokenHandler.WriteToken(token);
        }
        }
    }

