package com.github.seoapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.support.RequestContextUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@RequestMapping(value = "/{user_locale}/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, @PathVariable("user_locale") Locale user_locale, Model model) {
		logger.debug("User requested locale {}", user_locale);
		return processRequest(request, model);
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		return processRequest(request, model);
	}

	private String processRequest(HttpServletRequest request, Model model) {
		logger.info(
				"Welcome home! the client locale is {}",
				RequestContextUtils.getLocale(request) != null ? RequestContextUtils
						.getLocale(request).toString() : " not set");

		fillModel(RequestContextUtils.getLocale(request), model);

		return "home";
	}

	private void fillModel(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = locale != null ? DateFormat
				.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale)
				: DateFormat.getDateTimeInstance(DateFormat.LONG,
						DateFormat.LONG);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		if (locale != null) {
			model.addAttribute("currentLocale", locale.toString());
		}
	}

	public String privatePage(Locale locale, Model model) {
		logger.info("This is a private page the client locale is "
				+ locale.toString());

		fillModel(locale, model);
		return "secret";
	}

}
