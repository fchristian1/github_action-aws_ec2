import { render, screen } from '@testing-library/react'
import App from '../App';

describe('App Component', () => {
    it('renders the main heading', () => {
        render(<App />);
        expect(screen.getByText(/Vite \+ React/i)).toBeInTheDocument();
    });
});