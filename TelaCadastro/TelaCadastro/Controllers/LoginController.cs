using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DAL.Model;
using DAL.Persistence;
using TelaCadastro.Models;
using TelaCadastro.ViewModels;

namespace TelaCadastro.Controllers
{
    public class LoginController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogIn(FormCollection f)
        {
            try
            {

                UsuarioDal serviceusuario = new UsuarioDal();

                Usuario u = serviceusuario.ObterPorLogin(f["email"]);
                if (u != null)
                {
                    //if (Funcoes.getMD5Hash(f["senha"]).ToUpper() == u.senha.ToUpper())
                    //{
                    if (f["senha"] == u.senha)
                    {
                        IncluiPessoaNaSessao(f["email"]);


                        return RedirectToAction("Index", "Home");

                    }
                    //EnviarMensagem("Usuário ou Senha Incorreto(s)!", TipoMensagem.Vermelho);
                }
                else
                {
                    //EnviarMensagem("Usuário não encontrado!", TipoMensagem.Vermelho);
                }
            }
            catch (Exception ex)
            {
                //EnviarMensagem("Ocorreu um erro. Tente mais tarde.", TipoMensagem.Vermelho);
            }

            return RedirectToAction("Index");
        }

        private void IncluiPessoaNaSessao(string email)
        {
            FormsAuthentication.SetAuthCookie(email, false);

            SessaoUsuario.DefinirUsuarioTemp(email);
        }

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            SessaoUsuario.SessaoLimpar();
            return Redirect("~/Login/Index");
        }

    }
}